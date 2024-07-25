pragma solidity ^0.8.0;

contract CredentialDefinitionRegistry {
    
    //@dev Struct to store the credential definition details
    //@param schemaId The schema id of the credential definition
    //@param issuer The address of the issuer
    struct CredentialDefinition {
        string schemaId;
        address issuer;
    }

    //@dev Mapping to store the credential definitions
    mapping(string => CredentialDefinition) public credentialDefinitions;

    //@dev Function to register a credential definition
    //@param _credDefId The credential definition id
    //@param _schemaId The schema id of the credential definition
    //@param _issuer The address of the issuer
    //@notice This function is used to register a credential definition
    function registerCredentialDefinition(
        string memory _credDefId,
        string memory _schemaId,
        address _issuer
    ) public {
        require(
            bytes(credentialDefinitions[_credDefId].schemaId).length == 0,
            "Credential Definition already exists"
        );
        credentialDefinitions[_credDefId] = CredentialDefinition(
            _schemaId,
            _issuer
        );
    }

    //@dev Function to get a credential definition
    //@param _credDefId The credential definition id
    //@return schemaId The schema id of the credential definition
    //@return issuer The address of the issuer
    //@notice This function is used to get a credential definition
    function getCredentialDefinition(
        string memory _credDefId
    ) public view returns (string memory, address) {
        require(
            bytes(credentialDefinitions[_credDefId].schemaId).length != 0,
            "Credential Definition does not exist"
        );
        return (
            credentialDefinitions[_credDefId].schemaId,
            credentialDefinitions[_credDefId].issuer
        );
    }
}
