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
package org.finra.herd.service.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.finra.herd.dao.StoragePlatformDao;
import org.finra.herd.model.ObjectNotFoundException;
import org.finra.herd.model.jpa.StoragePlatformEntity;

/**
 * A helper class for shared storage platform operations.
 */
@Component
public class StoragePlatformHelper
{
    @Autowired
    private StoragePlatformDao storagePlatformDao;

    /**
     * Gets a storage platform entity by name.
     *
     * @param storagePlatformName the storage platform name.
     *
     * @return the retrieved storage platform.
     * @throws ObjectNotFoundException if the storage platform was not found.
     */
    public StoragePlatformEntity getStoragePlatformEntity(String storagePlatformName) throws ObjectNotFoundException
    {
        // Get the associated storage platform and verify that it exists.
        StoragePlatformEntity storagePlatformEntity = storagePlatformDao.getStoragePlatformByName(storagePlatformName);
        if (storagePlatformEntity == null)
        {
            throw new ObjectNotFoundException("Storage platform with name \"" + storagePlatformName + "\" doesn't exist.");
        }
        return storagePlatformEntity;
    }
}
