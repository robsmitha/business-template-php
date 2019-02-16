<?php
/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/27/2017
Description:	Creates the DAL class for  order table and respective stored procedures

*/



class Order {

	// This is for local purposes only! In hosted environments the db_settings.php file should be outside of the webroot, such as: include("/outside-webroot/db_settings.php");
	protected static function getDbSettings() { return "DAL/db_localsettings.php"; }

	/******************************************************************/
	// Properties
	/******************************************************************/

	protected $Id;
	protected $CustomerId;
	protected $OrderStatusTypeId;
	protected $OrderDate;
	protected $StripeCharge;
	protected $StripeCustomer;
	protected $StripeCard;
	protected $StripeAmount;


	/******************************************************************/
	// Constructors
	/******************************************************************/
	public function __construct() {
		$argv = func_get_args();
		switch( func_num_args() ) {
			case 0:
				self::__constructBase();
				break;
			case 1:
				self::__constructPK( $argv[0] );
				break;
			case 8:
				self::__constructFull( $argv[0], $argv[1], $argv[2], $argv[3], $argv[4], $argv[5], $argv[6], $argv[7] );
		}
	}


	public function __constructBase() {
		$this->Id = 0;
		$this->CustomerId = 0;
		$this->OrderStatusTypeId = 0;
		$this->OrderDate = "";
		$this->StripeCharge = "";
		$this->StripeCustomer = "";
		$this->StripeCard = "";
		$this->StripeAmount = 0;
	}


	public function __constructPK($paramId) {
		$this->load($paramId);
	}


	public function __constructFull($paramId,$paramCustomerId,$paramOrderStatusTypeId,$paramOrderDate,$paramStripeCharge,$paramStripeCustomer,$paramStripeCard,$paramStripeAmount) {
		$this->Id = $paramId;
		$this->CustomerId = $paramCustomerId;
		$this->OrderStatusTypeId = $paramOrderStatusTypeId;
		$this->OrderDate = $paramOrderDate;
		$this->StripeCharge = $paramStripeCharge;
		$this->StripeCustomer = $paramStripeCustomer;
		$this->StripeCard = $paramStripeCard;
		$this->StripeAmount = $paramStripeAmount;
	}


	/******************************************************************/
	// Accessors / Mutators
	/******************************************************************/

	public function getId(){
		return $this->Id;
	}
	public function setId($value){
		$this->Id = $value;
	}
	public function getCustomerId(){
		return $this->CustomerId;
	}
	public function setCustomerId($value){
		$this->CustomerId = $value;
	}
	public function getOrderStatusTypeId(){
		return $this->OrderStatusTypeId;
	}
	public function setOrderStatusTypeId($value){
		$this->OrderStatusTypeId = $value;
	}
	public function getOrderDate(){
		return $this->OrderDate;
	}
	public function setOrderDate($value){
		$this->OrderDate = $value;
	}
	public function getStripeCharge(){
		return $this->StripeCharge;
	}
	public function setStripeCharge($value){
		$this->StripeCharge = $value;
	}
	public function getStripeCustomer(){
		return $this->StripeCustomer;
	}
	public function setStripeCustomer($value){
		$this->StripeCustomer = $value;
	}
	public function getStripeCard(){
		return $this->StripeCard;
	}
	public function setStripeCard($value){
		$this->StripeCard = $value;
	}
	public function getStripeAmount(){
		return $this->StripeAmount;
	}
	public function setStripeAmount($value){
		$this->StripeAmount = $value;
	}


	/******************************************************************/
	// Public Methods
	/******************************************************************/


	public function load($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_Load(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);

		while ($row = $result->fetch_assoc()) {
		 $this->setId($row['Id']);
		 $this->setCustomerId($row['CustomerId']);
		 $this->setOrderStatusTypeId($row['OrderStatusTypeId']);
		 $this->setOrderDate($row['OrderDate']);
		 $this->setStripeCharge($row['StripeCharge']);
		 $this->setStripeCustomer($row['StripeCustomer']);
		 $this->setStripeCard($row['StripeCard']);
		 $this->setStripeAmount($row['StripeAmount']);
		}
	}


	public function save() {
		if ($this->getId() == 0)
			$this->insert();
		else
			$this->update();
	}

	/******************************************************************/
	// Private Methods
	/******************************************************************/



	private function insert() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_Add(?,?,?,?,?,?,?)');
		$arg1 = $this->getCustomerId();
		$arg2 = $this->getOrderStatusTypeId();
		$arg3 = $this->getOrderDate();
		$arg4 = $this->getStripeCharge();
		$arg5 = $this->getStripeCustomer();
		$arg6 = $this->getStripeCard();
		$arg7 = $this->getStripeAmount();
		$stmt->bind_param('iissssd',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		while ($row = $result->fetch_assoc()) {
			// By default, the DALGen generated INSERT procedure returns the scope identity as id
			$this->load($row['id']);
		}
	}


	private function update() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_Update(?,?,?,?,?,?,?,?)');
		$arg1 = $this->getId();
		$arg2 = $this->getCustomerId();
		$arg3 = $this->getOrderStatusTypeId();
		$arg4 = $this->getOrderDate();
		$arg5 = $this->getStripeCharge();
		$arg6 = $this->getStripeCustomer();
		$arg7 = $this->getStripeCard();
		$arg8 = $this->getStripeAmount();
		$stmt->bind_param('iiissssd',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7,$arg8);
		$stmt->execute();
	}

	private static function setNullValue($value){
		if ($value == "")
			return null;
		else
			return $value;
	}

	/******************************************************************/
	// Static Methods
	/******************************************************************/



	public static function loadall() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_LoadAll()');
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$order = new Order($row['Id'],$row['CustomerId'],$row['OrderStatusTypeId'],$row['OrderDate'],$row['StripeCharge'],$row['StripeCustomer'],$row['StripeCard'],$row['StripeAmount']);
				$arr[] = $order;
			}
			return $arr;
		}
		else {
			//die("The query yielded zero results.No rows found.");
		}
	}


	public static function remove($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_Delete(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();
	}


	public static function search($paramId,$paramCustomerId,$paramOrderStatusTypeId,$paramOrderDate,$paramStripeCharge,$paramStripeCustomer,$paramStripeCard,$paramStripeAmount) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_order_Search(?,?,?,?,?,?,?,?)');
		$arg1 = Order::setNullValue($paramId);
		$arg2 = Order::setNullValue($paramCustomerId);
		$arg3 = Order::setNullValue($paramOrderStatusTypeId);
		$arg4 = Order::setNullValue($paramOrderDate);
		$arg5 = Order::setNullValue($paramStripeCharge);
		$arg6 = Order::setNullValue($paramStripeCustomer);
		$arg7 = Order::setNullValue($paramStripeCard);
		$arg8 = Order::setNullValue($paramStripeAmount);
		$stmt->bind_param('iiissssd',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7,$arg8);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$order = new Order($row['Id'],$row['CustomerId'],$row['OrderStatusTypeId'],$row['OrderDate'],$row['StripeCharge'],$row['StripeCustomer'],$row['StripeCard'],$row['StripeAmount']);
				$arr[] = $order;
			}
			return $arr;
		}
		else {
			//die("The query yielded zero results.No rows found.");
		}
	}
    public static function loadbycustomerid($paramCustomerId) {
        include(self::getDbSettings());
        $conn = new mysqli($servername, $username, $password, $dbname);
        $stmt = $conn->prepare('CALL usp_order_LoadByCustomerId(?)');
        $stmt->bind_param('i', $paramCustomerId);
        $stmt->execute();
        $result = $stmt->get_result();
        if (!$result) die($conn->error);
        if ($result->num_rows > 0) {
            $arr = array();
            while ($row = $result->fetch_assoc()) {
                $order = new Order($row['Id'],$row['CustomerId'],$row['OrderStatusTypeId'],$row['OrderDate'],$row['StripeCharge'],$row['StripeCustomer'],$row['StripeCard'],$row['StripeAmount']);
                $arr[] = $order;
            }
            return $arr;
        }
        else {
            //echo "The query yielded zero results.No rows found.";
        }
    }
}
