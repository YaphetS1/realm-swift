////////////////////////////////////////////////////////////////////////////
//
// Copyright 2016 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#import "RLMUser.h"

#import "shared_realm.hpp"

@interface RLMUser ()

@property (nonatomic) RLMIdentity identity;

@property (nonatomic) NSURL *authURL;
@property (nonatomic) NSURL *objectServerURL;

@property (nonatomic) RLMServerToken refreshToken;
@property (nonatomic) NSTimeInterval refreshTokenExpiry;

- (void)_registerRealmForBindingWithFileURL:(const std::string&)fileURL
                            remoteServerURL:(NSURL *)remoteURL
                               onCompletion:(RLMErrorReportingBlock)completion;

- (void)_reportRefreshFailureForPath:(RLMServerPath)path error:(NSError *)error;

@end