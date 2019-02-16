<?php
/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/9/2017
Description:	Creates the DAL class for  customer table and respective stored procedures

*/



class Customer {

	// This is for local purposes only! In hosted environments the db_settings.php file should be outside of the webroot, such as: include("/outside-webroot/db_settings.php");
	protected static function getDbSettings() { return "DAL/db_localsettings.php"; }

	/******************************************************************/
	// Properties
	/******************************************************************/

	protected $Id;
	protected $FirstName;
	protected $LastName;
	protected $Email;
	protected $Password;
	protected $CreateDate;


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
			case 6:
				self::__constructFull( $argv[0], $argv[1], $argv[2], $argv[3], $argv[4], $argv[5] );
		}
	}


	public function __constructBase() {
		$this->Id = 0;
		$this->FirstName = "";
		$this->LastName = "";
		$this->Email = "";
		$this->Password = "";
		$this->CreateDate = "";
	}


	public function __constructPK($paramId) {
		$this->load($paramId);
	}


	public function __constructFull($paramId,$paramFirstName,$paramLastName,$paramEmail,$paramPassword,$paramCreateDate) {
		$this->Id = $paramId;
		$this->FirstName = $paramFirstName;
		$this->LastName = $paramLastName;
		$this->Email = $paramEmail;
		$this->Password = $paramPassword;
		$this->CreateDate = $paramCreateDate;
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
	public function getFirstName(){
		return $this->FirstName;
	}
	public function setFirstName($value){
		$this->FirstName = $value;
	}
	public function getLastName(){
		return $this->LastName;
	}
	public function setLastName($value){
		$this->LastName = $value;
	}
	public function getEmail(){
		return $this->Email;
	}
	public function setEmail($value){
		$this->Email = $value;
	}
	public function getPassword(){
		return $this->Password;
	}
	public function setPassword($value){
		$this->Password = $value;
	}
	public function getCreateDate(){
		return $this->CreateDate;
	}
	public function setCreateDate($value){
		$this->CreateDate = $value;
	}


	/******************************************************************/
	// Public Methods
	/******************************************************************/


	public function load($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_customer_Load(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);

		while ($row = $result->fetch_assoc()) {
		 $this->setId($row['Id']);
		 $this->setFirstName($row['FirstName']);
		 $this->setLastName($row['LastName']);
		 $this->setEmail($row['Email']);
		 $this->setPassword($row['Password']);
		 $this->setCreateDate($row['CreateDate']);
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
		$stmt = $conn->prepare('CALL usp_customer_Add(?,?,?,?,?)');
		$arg1 = $this->getFirstName();
		$arg2 = $this->getLastName();
		$arg3 = $this->getEmail();
		$arg4 = $this->getPassword();
		$arg5 = $this->getCreateDate();
		$stmt->bind_param('sssss',$arg1,$arg2,$arg3,$arg4,$arg5);
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
		$stmt = $conn->prepare('CALL usp_customer_Update(?,?,?,?,?,?)');
		$arg1 = $this->getId();
		$arg2 = $this->getFirstName();
		$arg3 = $this->getLastName();
		$arg4 = $this->getEmail();
		$arg5 = $this->getPassword();
		$arg6 = $this->getCreateDate();
		$stmt->bind_param('isssss',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6);
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
		$stmt = $conn->prepare('CALL usp_customer_LoadAll()');
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$customer = new Customer($row['Id'],$row['FirstName'],$row['LastName'],$row['Email'],$row['Password'],$row['CreateDate']);
				$arr[] = $customer;
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
		$stmt = $conn->prepare('CALL usp_customer_Delete(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();
	}


	public static function search($paramId,$paramFirstName,$paramLastName,$paramEmail,$paramPassword,$paramCreateDate) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_customer_Search(?,?,?,?,?,?)');
		$arg1 = Customer::setNullValue($paramId);
		$arg2 = Customer::setNullValue($paramFirstName);
		$arg3 = Customer::setNullValue($paramLastName);
		$arg4 = Customer::setNullValue($paramEmail);
		$arg5 = Customer::setNullValue($paramPassword);
		$arg6 = Customer::setNullValue($paramCreateDate);
		$stmt->bind_param('isssss',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$customer = new Customer($row['Id'],$row['FirstName'],$row['LastName'],$row['Email'],$row['Password'],$row['CreateDate']);
				$arr[] = $customer;
			}
			return $arr;
		}
		else {
			//die("The query yielded zero results.No rows found.");
		}
	}
    public static function lookup($paramEmail) {
        include(self::getDbSettings());
        $conn = new mysqli($servername, $username, $password, $dbname);
        $stmt = $conn->prepare('CALL usp_customer_Lookup(?)');
        $arg1 = Customer::setNullValue($paramEmail);
        $stmt->bind_param('s',$arg1);
        $stmt->execute();
        $result = $stmt->get_result();
        if (!$result) die($conn->error);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            return new Customer($row['Id'],$row['FirstName'],$row['LastName'],$row['Email'],$row['Password'],$row['CreateDate']);
        }
        else {
            return 0;
        }
    }
}
