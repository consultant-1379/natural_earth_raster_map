<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld
http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd" version="1.0.0">
  <NamedLayer>
    <Name>raster_layer</Name>
    <UserStyle>
      <Name>raster</Name>
      <Title>A boring default style</Title>
      <Abstract>A sample style for rasters</Abstract>
      <FeatureTypeStyle>
        <Name>name</Name>
        <Rule>
          <Name>Zoom From 1:558M To 1:9M</Name>
          <Title>Zoom 1:9M</Title>
          <MinScaleDenominator>9.0E6</MinScaleDenominator>
          <MaxScaleDenominator>558.0E6</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>1.0</Opacity>
          </RasterSymbolizer>
        </Rule>
       
        <Rule>
          <Name>Zoom From 1:9M To 1:4M</Name>
          <Title>Zoom 1:4M</Title>
          <MinScaleDenominator>4.0E6</MinScaleDenominator>
          <MaxScaleDenominator>9.0E6</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>0.8</Opacity>
          </RasterSymbolizer>
        </Rule>

        <Rule>
          <Name>Zoom From 1:4M To 1:2M</Name>
          <Title>Zoom 1:2K</Title>
          <MinScaleDenominator>2.0E6</MinScaleDenominator>
          <MaxScaleDenominator>4.0E6</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>0.4</Opacity>
          </RasterSymbolizer>
        </Rule>

        <Rule>
          <Name>Zoom From 1:2M To 1:1M</Name>
          <Title>Zoom 1:1M</Title>
          <MinScaleDenominator>1.0E6</MinScaleDenominator>
          <MaxScaleDenominator>2.0E6</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>0.2</Opacity>
          </RasterSymbolizer>
        </Rule>
        
        <Rule>
          <Name>Zoom From 1:1M To 1:707K</Name>
          <Title>Zoom 1:1K</Title>
          <MinScaleDenominator>707.0E3</MinScaleDenominator>
          <MaxScaleDenominator>1.0E6</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>0.15</Opacity>
          </RasterSymbolizer>
        </Rule>

        <Rule>
          <Name>Zoom From 1:707K To 1:1K</Name>
          <Title>Zoom 1:1K</Title>
          <MinScaleDenominator>1.0E3</MinScaleDenominator>
          <MaxScaleDenominator>707.0E3</MaxScaleDenominator>
          <RasterSymbolizer>
            <Opacity>0.0</Opacity>
          </RasterSymbolizer>
        </Rule>

      
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>