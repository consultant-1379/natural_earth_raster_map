<StyledLayerDescriptor 
version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink">
  <NamedLayer>
    <Name>direction-arrows</Name>
    <UserStyle>
      <Name>direction-arrows</Name>
      <FeatureTypeStyle>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>oneway</PropertyName>
              <Literal>yes</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 12 10 152</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 12 9 153</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 18 2 154</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 18 1 155</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>oneway</PropertyName>
              <Literal>-1</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 12 10 152</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 13 9 152</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 14 2 158</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">0 15 1 158</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-linejoin">bevel</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>