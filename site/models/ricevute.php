<?php

/**
 * @version    CVS: 1.0.4
 * @package    Com_Tgriparti
 * @author     Todaro Giovanni <Info@todarogiovanni.eu>
 * @copyright  2016 Todaro Giovanni - Consiglio Nazionale delle Ricerche -  Istituto per le Tecnologie Didattiche
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Tgriparti records.
 *
 * @since  1.6
 */
class TgripartiModelRicevute extends JModelList
{
	/**
	 * Constructor.
	 *
	 * @param   array  $config  An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'a.id',
				'ordering', 'a.ordering',
				'state', 'a.state',
				'created_by', 'a.created_by',
				'modified_by', 'a.modified_by',
				'nome', 'a.nome',
				'descrizione', 'a.descrizione',
				'costo', 'a.costo',
				'data', 'a.data',
				'condominio', 'a.condominio',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param   string  $ordering   Elements order
	 * @param   string  $direction  Order direction
	 *
	 * @return void
	 *
	 * @throws Exception
	 *
	 * @since    1.6
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		// Initialise variables.
		$app = JFactory::getApplication();

		$list = $app->getUserState($this->context . '.list');
		
		if (empty($list['ordering']))
{
	$list['ordering'] = 'ordering';
}

if (empty($list['direction']))
{
	$list['direction'] = 'asc';
}

		if (isset($list['ordering']))
		{
			$this->setState('list.ordering', $list['ordering']);
		}

		if (isset($list['direction']))
		{
			$this->setState('list.direction', $list['direction']);
		}

		// List state information.
		parent::populateState($ordering, $direction);
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return   JDatabaseQuery
	 *
	 * @since    1.6
	 */
	protected function getListQuery()
	{
		// Create a new query object.
		$db    = $this->getDbo();
		$query = $db->getQuery(true);

		// Select the required fields from the table.
		$query
			->select(
				$this->getState(
					'list.select', 'DISTINCT a.*'
				)
			);

		$query->from('`#__tgriparti_ricevuta` AS a');
		
		// Join over the users for the checked out user.
		$query->select('uc.name AS editor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the created by field 'created_by'
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

		// Join over the created by field 'modified_by'
		$query->join('LEFT', '#__users AS modified_by ON modified_by.id = a.modified_by');
		// Join over the foreign key 'condominio'
		$query->select('CONCAT (`#__tgriparti_condominio_2407654`.`via`, \' \', `#__tgriparti_condominio_2407654`.`cap`, \' \', `#__tgriparti_condominio_2407654`.`citta`) AS condomini_fk_value_2407654');
		$query->join('LEFT', '#__tgriparti_condominio AS #__tgriparti_condominio_2407654 ON #__tgriparti_condominio_2407654.`id` = a.`condominio`');
		
		if (!JFactory::getUser()->authorise('core.edit', 'com_tgriparti'))
		{
			$query->where('a.state = 1');
		}

		// Filter by search in title
		$search = $this->getState('filter.search');

		if (!empty($search))
		{
			if (stripos($search, 'id:') === 0)
			{
				$query->where('a.id = ' . (int) substr($search, 3));
			}
			else
			{
				$search = $db->Quote('%' . $db->escape($search, true) . '%');
				$query->where('( a.nome LIKE ' . $search . ' )');
			}
		}
		

		// Filtering data
		// Checking "_dateformat"
		$filter_data_from = $this->state->get("filter.data_from_dateformat");
		$filter_Qdata_from = (!empty($filter_data_from)) ? $this->isValidDate($filter_data_from) : null;

		if ($filter_Qdata_from != null)
		{
			$query->where("a.data >= '" . $db->escape($filter_Qdata_from) . "'");
		}

		$filter_data_to = $this->state->get("filter.data_to_dateformat");
		$filter_Qdata_to = (!empty($filter_data_to)) ? $this->isValidDate($filter_data_to) : null ;

		if ($filter_Qdata_to != null)
		{
			$query->where("a.data <= '" . $db->escape($filter_Qdata_to) . "'");
		}

		// Filtering condominio
		$filter_condominio = $this->state->get("filter.condominio");
		if ($filter_condominio)
		{
			$query->where("a.condominio = '".$db->escape($filter_condominio)."'");
		}

		// Add the list ordering clause.
		$orderCol  = $this->state->get('list.ordering');
		$orderDirn = $this->state->get('list.direction');

		if ($orderCol && $orderDirn)
		{
			$query->order($db->escape($orderCol . ' ' . $orderDirn));
		}

		return $query;
	}

	/**
	 * Method to get an array of data items
	 *
	 * @return  mixed An array of data on success, false on failure.
	 */
	public function getItems()
	{
		$items = parent::getItems();
		
		foreach ($items as $item)
		{
			if (isset($item->condominio) && $item->condominio != '')
			{
				if (is_object($item->condominio))
				{
					$item->condominio = \Joomla\Utilities\ArrayHelper::fromObject($item->condominio);
				}

				$values = (is_array($item->condominio)) ? $item->condominio : explode(',', $item->condominio);
				$textValue = array();

				foreach ($values as $value)
				{
					$db = JFactory::getDbo();
					$query = $db->getQuery(true);
					$query
							->select('CONCAT (`#__tgriparti_condominio_2407654`.`via`, \' \', `#__tgriparti_condominio_2407654`.`cap`, \' \', `#__tgriparti_condominio_2407654`.`citta`) AS `fk_value`')
							->from($db->quoteName('#__tgriparti_condominio', '#__tgriparti_condominio_2407654'))
						->where($db->quoteName('id') . ' = ' . $db->quote($db->escape($value)));
					$db->setQuery($query);
					$results = $db->loadObject();

					if ($results)
					{
						$textValue[] = $results->fk_value;
					}
				}

				$item->condominio = !empty($textValue) ? implode(', ', $textValue) : $item->condominio;
			}

		}

		return $items;
	}

	/**
	 * Overrides the default function to check Date fields format, identified by
	 * "_dateformat" suffix, and erases the field if it's not correct.
	 *
	 * @return void
	 */
	protected function loadFormData()
	{
		$app              = JFactory::getApplication();
		$filters          = $app->getUserState($this->context . '.filter', array());
		$error_dateformat = false;

		foreach ($filters as $key => $value)
		{
			if (strpos($key, '_dateformat') && !empty($value) && $this->isValidDate($value) == null)
			{
				$filters[$key]    = '';
				$error_dateformat = true;
			}
		}

		if ($error_dateformat)
		{
			$app->enqueueMessage(JText::_("COM_TGRIPARTI_SEARCH_FILTER_DATE_FORMAT"), "warning");
			$app->setUserState($this->context . '.filter', $filters);
		}

		return parent::loadFormData();
	}

	/**
	 * Checks if a given date is valid and in a specified format (YYYY-MM-DD)
	 *
	 * @param   string  $date  Date to be checked
	 *
	 * @return bool
	 */
	private function isValidDate($date)
	{
		$date = str_replace('/', '-', $date);
		return (date_create($date)) ? JFactory::getDate($date)->format("Y-m-d") : null;
	}
}
