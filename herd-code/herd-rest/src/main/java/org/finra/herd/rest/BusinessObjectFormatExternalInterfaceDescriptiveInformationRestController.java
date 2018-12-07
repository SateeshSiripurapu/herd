/*
* Copyright 2015 herd contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package org.finra.herd.rest;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import org.finra.herd.model.api.xml.BusinessObjectFormatExternalInterfaceDescriptiveInformation;
import org.finra.herd.model.api.xml.BusinessObjectFormatExternalInterfaceDescriptiveInformationKey;
import org.finra.herd.model.dto.SecurityFunctions;
import org.finra.herd.service.BusinessObjectFormatExternalInterfaceDescriptiveInformationService;
import org.finra.herd.ui.constants.UiConstants;

/**
 * The REST controller that handles business object format external interface descriptive information REST requests.
 */
@RestController
@RequestMapping(value = UiConstants.REST_URL_BASE, produces = {"application/xml", "application/json"})
@Api(tags = "Business Object Format External Interface Descriptive Information")
public class BusinessObjectFormatExternalInterfaceDescriptiveInformationRestController
{
    private static final String BUSINESS_OBJECT_FORMAT_EXTERNAL_INTERFACE_DESCRIPTIVE_INFORMATION_URI_PREFIX =
        "/businessObjectFormatExternalInterfaceDescriptiveInformation";

    @Autowired
    private BusinessObjectFormatExternalInterfaceDescriptiveInformationService businessObjectFormatExternalInterfaceDescriptiveInformationService;


    /**
     * Retrieves the existing business object format external interface descriptive information based on the specified parameters.
     *
     * @param namespace the namespace
     * @param businessObjectDefinitionName the business object definition name
     * @param businessObjectFormatUsage the business object format usage
     * @param businessObjectFormatFileType the business object format file type
     * @param externalInterfaceName the external interface name
     *
     * @return the retrieved business object format external interface descriptive information
     */
    @RequestMapping(value = BUSINESS_OBJECT_FORMAT_EXTERNAL_INTERFACE_DESCRIPTIVE_INFORMATION_URI_PREFIX +
        "/namespaces/{namespace}/businessObjectDefinitionNames/{businessObjectDefinitionName}/businessObjectFormatUsages/{businessObjectFormatUsage}" +
        "/businessObjectFormatFileTypes/{businessObjectFormatFileType}/externalInterfaceNames/{externalInterfaceName}", method = RequestMethod.GET)
    @Secured(SecurityFunctions.FN_BUSINESS_OBJECT_FORMAT_EXTERNAL_INTERFACE_DESCRIPTIVE_INFORMATION_GET)
    public BusinessObjectFormatExternalInterfaceDescriptiveInformation getBusinessObjectFormatExternalInterface(@PathVariable("namespace") String namespace,
        @PathVariable("businessObjectDefinitionName") String businessObjectDefinitionName,
        @PathVariable("businessObjectFormatUsage") String businessObjectFormatUsage,
        @PathVariable("businessObjectFormatFileType") String businessObjectFormatFileType, @PathVariable("externalInterfaceName") String externalInterfaceName)
    {
        return businessObjectFormatExternalInterfaceDescriptiveInformationService.getBusinessObjectFormatExternalInterfaceDescriptiveInformation(
            new BusinessObjectFormatExternalInterfaceDescriptiveInformationKey(namespace, businessObjectDefinitionName, businessObjectFormatUsage,
                businessObjectFormatFileType, externalInterfaceName));
    }
}
