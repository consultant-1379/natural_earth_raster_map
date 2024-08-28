<StyledLayerDescriptor 
version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink">
  <NamedLayer>
    <Name>Pedestrian Walkways And Alleys</Name>
    <UserStyle>
      <Name>Pedestrian Walkways And Alleys</Name>
      <FeatureTypeStyle>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <Or>
              <PropertyIsEqualTo>
                <PropertyName>highway</PropertyName>
                <Literal>cycleway</Literal>
              </PropertyIsEqualTo>
              <And>
                <PropertyIsEqualTo>
                  <PropertyName>highway</PropertyName>
                  <Literal>path</Literal>
                </PropertyIsEqualTo>
                <PropertyIsEqualTo>
                  <PropertyName>bicycle</PropertyName>
                  <Literal>designated</Literal>
                </PropertyIsEqualTo>
              </And>
            </Or>
          </Filter>
          <MinScaleDenominator>5000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">4 4</CssParameter>
              <CssParameter name="stroke-opacity">.3</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke">#808040</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <Or>
              <PropertyIsEqualTo>
                <PropertyName>highway</PropertyName>
                <Literal>cycleway</Literal>
              </PropertyIsEqualTo>
              <And>
                <PropertyIsEqualTo>
                  <PropertyName>highway</PropertyName>
                  <Literal>path</Literal>
                </PropertyIsEqualTo>
                <PropertyIsEqualTo>
                  <PropertyName>bicycle</PropertyName>
                  <Literal>designated</Literal>
                </PropertyIsEqualTo>
              </And>
            </Or>
          </Filter>
          <MaxScaleDenominator>5000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">6 4</CssParameter>
              <CssParameter name="stroke-opacity">.3</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#808040</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

            
      <FeatureTypeStyle>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <Or>
              <Or>
                <Or>
                  <PropertyIsEqualTo>
                    <PropertyName>highway</PropertyName>
                    <Literal>pedestrian</Literal>
                  </PropertyIsEqualTo>
                  <PropertyIsEqualTo>
                    <PropertyName>highway</PropertyName>
                    <Literal>footway</Literal>
                  </PropertyIsEqualTo>
                </Or>
                <PropertyIsEqualTo>
                  <PropertyName>highway</PropertyName>
                  <Literal>path</Literal>
                </PropertyIsEqualTo>
              </Or>
              <PropertyIsEqualTo>
                <PropertyName>highway</PropertyName>
                <Literal>track</Literal>
              </PropertyIsEqualTo>
            </Or>
          </Filter>
          <MinScaleDenominator>5000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">1 3</CssParameter>
              <CssParameter name="stroke-opacity">.3</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke">#808040</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <Or>
              <Or>
                <PropertyIsEqualTo>
                  <PropertyName>highway</PropertyName>
                  <Literal>pedestrian</Literal>
                </PropertyIsEqualTo>
                <PropertyIsEqualTo>
                  <PropertyName>highway</PropertyName>
                  <Literal>footway</Literal>
                </PropertyIsEqualTo>
              </Or>
              <PropertyIsEqualTo>
                <PropertyName>highway</PropertyName>
                <Literal>path</Literal>
              </PropertyIsEqualTo>
            </Or>
          </Filter>
          <MaxScaleDenominator>5000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-dasharray">2 4</CssParameter>
              <CssParameter name="stroke-opacity">.3</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#808040</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>25000</MinScaleDenominator>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">.5</CssParameter>
              <CssParameter name="stroke">#bfbfbf</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>25000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#b3b1b2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>2500</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
              <CssParameter name="stroke">#b3b1b2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MaxScaleDenominator>2500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">5</CssParameter>
              <CssParameter name="stroke">#b3b1b2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
            <FeatureTypeStyle>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>25000</MinScaleDenominator>
          <MaxScaleDenominator>50000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">.5</CssParameter>
              <CssParameter name="stroke">#bfbfbf</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>25000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke">#ffffff</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MinScaleDenominator>2500</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke">#ffffff</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Filter xmlns="http://www.opengis.net/ogc">
            <PropertyIsEqualTo>
              <PropertyName>highway</PropertyName>
              <Literal>service</Literal>
            </PropertyIsEqualTo>
          </Filter>
          <MaxScaleDenominator>2500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
              <CssParameter name="stroke">#ffffff</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>