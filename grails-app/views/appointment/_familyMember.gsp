

                <label class="control-label">Select other member of the family<span class="required-indicator">*</span></label>
                <g:each var="member" in="${personList}" status="i">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <input type="checkbox" name="checkbox_person_${i}" value="${member?.id}"/>
                                    </span>
                                    <input type="text" class="form-control" value="${member}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p>
                    <p>
                </g:each>
