<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="100000000" simplifyAlgorithm="0" simplifyLocal="1" labelsEnabled="0" version="3.14.0-Pi" styleCategories="AllStyleCategories" readOnly="0" simplifyDrawingHints="1" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal enabled="0" startExpression="" endExpression="" fixedDuration="0" durationUnit="min" accumulate="0" startField="" mode="0" endField="" durationField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 symbollevels="0" attr="TENSION" forceraster="0" type="categorizedSymbol" enableorderby="0">
    <categories>
      <category render="true" value="138" symbol="0" label="138"/>
      <category render="true" value="220" symbol="1" label="220"/>
      <category render="true" value="500" symbol="2" label="500"/>
    </categories>
    <symbols>
      <symbol name="0" alpha="1" type="line" force_rhr="0" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="56,168,0,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="Point" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" alpha="1" type="line" force_rhr="0" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,112,255,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="Point" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="2" alpha="1" type="line" force_rhr="0" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="115,0,76,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="Point" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties/>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks type="StringList">
      <Option value="" type="QString"/>
    </activeChecks>
    <checkConfiguration/>
  </geometryOptions>
  <referencedLayers/>
  <referencingLayers/>
  <fieldConfiguration>
    <field name="OBJECTID">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="NOMBRE_LIN">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="TENSION">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="NUMERO_TER">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="OBJECTID"/>
    <alias index="1" name="" field="NOMBRE_LIN"/>
    <alias index="2" name="" field="TENSION"/>
    <alias index="3" name="" field="NUMERO_TER"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="OBJECTID" expression=""/>
    <default applyOnUpdate="0" field="NOMBRE_LIN" expression=""/>
    <default applyOnUpdate="0" field="TENSION" expression=""/>
    <default applyOnUpdate="0" field="NUMERO_TER" expression=""/>
  </defaults>
  <constraints>
    <constraint constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1" field="OBJECTID"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0" field="NOMBRE_LIN"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0" field="TENSION"/>
    <constraint constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0" field="NUMERO_TER"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="OBJECTID"/>
    <constraint exp="" desc="" field="NOMBRE_LIN"/>
    <constraint exp="" desc="" field="TENSION"/>
    <constraint exp="" desc="" field="NUMERO_TER"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns/>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable/>
  <labelOnTop/>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression></previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
