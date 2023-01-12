// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract SVG  {
    using Strings for uint256;
    
    string constant COLLAR = string(abi.encodePacked(
                "<path id='collar_light1' fill='#858280' d='M209.603 36.324c0-9.021 1.994-15.153 5.499-19.333l-34.49 28.812s-3.026 51.773 38.827 91.519l26.112-26.226c-20.592-10.507-35.948-49.692-35.948-74.772z'/>",
                "<path id='collar_dark' fill='#474646' d='M218.655 75.94c-.981-5.317-1.507-10.424-1.507-15.05 0-9.021-9.57-5.494-6.064-9.674-.963-5.259-1.481-10.313-1.481-14.892 0-9.021 1.994-15.153 5.499-19.333l-34.49 28.812s-1.092 18.774 7.171 42.387c-1.347-10.076-.973-16.518-.973-16.518l1.338-1.118c-.084 1.955-.617 19.919 7.181 42.202-1.347-10.076-.973-16.518-.973-16.518l24.299-20.298z'/>",
                "<path id='collar_light2' fill='#858280' d='m331.386 45.804-34.49-28.812c3.505 4.18 5.499 10.311 5.499 19.333 0 25.08-15.356 64.265-35.948 74.772l26.112 26.226c41.855-39.746 38.827-91.519 38.827-91.519z'/>"
    ));

    string constant OUTLINE = string(abi.encodePacked(
            "<path id='Outline' fill='#231f20' d='M510.078 176.587 417.282 65.718a8.08 8.08 0 0 0-3.828-2.54l-76.9-23.59-33.887-28.308C292.639.016 274.828 0 260.572 0l-4.574.003L251.425 0c-14.255 0-32.066.016-42.095 11.28l-33.887 28.309-76.898 23.589a8.08 8.08 0 0 0-3.828 2.54L1.922 176.587a8.083 8.083 0 0 0 .637 11.055l70.606 66.938a8.082 8.082 0 0 0 10.862.238l29.986-26.033v275.131a8.084 8.084 0 0 0 8.084 8.084h200.61c4.465 0 8.084-3.618 8.084-8.084s-3.62-8.084-8.084-8.084H130.182V185.059c0-4.466-3.62-8.084-8.084-8.084s-8.084 3.618-8.084 8.084v22.314L78.967 237.8l-59.768-56.663L105.58 77.933l67.292-20.643c1.563 18.607 8.893 55.403 41.001 85.895a8.063 8.063 0 0 0 5.566 2.223c.358 0 .715-.032 1.069-.08a8.066 8.066 0 0 0 6.796-2.301l21.59-21.689c2.417.43 4.78.515 6.885.532.073 0 .147.005.221.005.054 0 .108-.003.161-.004l1.307.005.666-.001c2.277 0 4.551-.286 6.811-.829l21.884 21.982a8.063 8.063 0 0 0 5.73 2.38c.355 0 .708-.031 1.06-.078a8.063 8.063 0 0 0 6.639-2.144c31.628-30.032 39.195-66.493 40.915-85.268l65.247 20.015 86.381 103.204-59.768 56.663-35.048-30.427v-22.314a8.084 8.084 0 0 0-8.084-8.084 8.083 8.083 0 0 0-8.084 8.084V495.83h-33.24c-4.465 0-8.084 3.618-8.084 8.084s3.62 8.084 8.084 8.084h41.324a8.083 8.083 0 0 0 8.084-8.084v-275.13l29.986 26.033a8.081 8.081 0 0 0 10.862-.238l70.606-66.938a8.08 8.08 0 0 0 .639-11.054zm-216.544-51.884L280.1 111.208a64.601 64.601 0 0 0 .645-.608 61.003 61.003 0 0 0 3.191-3.29c.134-.148.267-.298.4-.447.364-.412.727-.832 1.088-1.26.149-.176.299-.348.445-.526.427-.516.85-1.043 1.272-1.582.266-.341.528-.689.791-1.036.162-.215.323-.428.484-.645.31-.418.617-.841.921-1.269l.201-.286c2.925-4.145 5.578-8.684 7.935-13.44.092-.184.182-.371.273-.556a162.093 162.093 0 0 0 1.636-3.467l.071-.161c6.098-13.484 10.032-28.464 10.851-41.412.015-.22.027-.437.04-.654.029-.521.06-1.042.079-1.556.002-.059.008-.122.01-.181l12.905 10.779c-.222 10.72-3.13 45.287-29.804 75.092zM255.999 16.172l4.574-.003c16.334 0 25.253.878 29.751 5.522.121.168.243.335.377.496 2.396 2.855 3.61 7.613 3.61 14.138a55.405 55.405 0 0 1-.13 3.78c-.018.308-.036.617-.058.927a74.372 74.372 0 0 1-.18 2.034l-.013.128c-.736 7.022-2.515 14.729-5.073 22.264-.196.572-.397 1.144-.602 1.713-.072.202-.14.403-.213.604-5.258 14.347-13.247 27.493-21.706 33.875l-.11.084c-.354.264-.708.497-1.063.736-.266.178-.531.366-.8.531-.016.011-.032.018-.05.028-.512.313-1.026.604-1.544.867-.039.019-.073.045-.112.066-2.205 1.113-4.419 1.73-6.605 1.741l-.129-.001c-2.181-.013-4.389-.628-6.59-1.74-.038-.02-.072-.045-.111-.066a23.685 23.685 0 0 1-1.538-.864c-.018-.012-.037-.02-.055-.032-.266-.164-.53-.352-.796-.528-.356-.241-.712-.474-1.067-.739-.036-.026-.071-.055-.107-.082-8.459-6.382-16.45-19.529-21.709-33.878-.071-.195-.138-.392-.208-.587-.207-.573-.409-1.148-.606-1.725-2.558-7.536-4.337-15.243-5.074-22.266l-.013-.128a74.372 74.372 0 0 1-.18-2.034c-.023-.31-.04-.619-.058-.927-.029-.465-.058-.929-.077-1.386a62.523 62.523 0 0 1-.053-2.394c0-6.526 1.214-11.282 3.61-14.138a8 8 0 0 0 .377-.496c4.501-4.643 13.42-5.521 29.754-5.521l4.577.001zM190.79 47.836l10.777-9.003.009.181c.018.514.05 1.036.079 1.556.013.218.025.434.04.654.82 12.952 4.757 27.938 10.859 41.427.022.047.041.095.063.141.213.471.432.939.652 1.406.321.691.649 1.376.983 2.059.093.189.184.378.278.567 2.357 4.756 5.008 9.293 7.933 13.436l.201.286c.304.427.611.85.922 1.269.16.216.321.428.482.64.264.348.526.698.794 1.041.42.538.845 1.065 1.271 1.58.148.178.298.35.445.526.36.428.723.848 1.088 1.26.134.15.266.3.4.448a62.48 62.48 0 0 0 3.188 3.289l.038.036a54.971 54.971 0 0 0 1.735 1.586l-12.43 12.485c-28.246-31.606-29.816-68.872-29.807-76.87z'/>",
            "<path id='numberOutline' fill='#231f20' d='M318.5 228.714H193.498c-11.591 0-21.019 9.429-21.019 21.019v103.478c0 11.59 9.428 21.019 21.019 21.019h18.187a8.083 8.083 0 0 0 8.084-8.084 8.084 8.084 0 0 0-8.084-8.084h-18.187a4.857 4.857 0 0 1-4.851-4.851V249.733a4.857 4.857 0 0 1 4.851-4.851H318.5a4.857 4.857 0 0 1 4.851 4.851v103.478a4.857 4.857 0 0 1-4.851 4.851h-79.868a8.083 8.083 0 0 0-8.084 8.084 8.084 8.084 0 0 0 8.084 8.084H318.5c11.591 0 21.019-9.429 21.019-21.019V249.733c0-11.589-9.429-21.019-21.019-21.019z'/>"
    ));

    string constant INNER_SUFFIX = string(abi.encodePacked(
        "<animate attributeName='opacity' dur='10s'  values='0; 0.1; 0.2; 0.25; 0.25; 0.2; 0.1; 0' repeatCount='indefinite' /></rect>",
        "<path id='inner1' fill='#78716f' d='M302.395 36.324c0 29.171-20.771 77.466-46.396 77.466s-46.396-48.295-46.396-77.466 20.771-28.237 46.396-28.237 46.396-.934 46.396 28.237z'/>",
        "<path id='inner2' fill='#524d4c' d='M261.406 36.324c0-18.252 8.132-24.718 20.495-27.001-7.397-1.367-16.309-1.236-25.901-1.236-25.625 0-46.396-.935-46.396 28.237S230.375 113.79 256 113.79c9.592 0 18.504-6.767 25.901-16.767-12.364-16.71-20.495-42.447-20.495-60.699z'/>"
    ));

    string constant JERSEY_SUFFIX = string(abi.encodePacked(
            "' d='M348.578 503.916h41.324V211.06l43.37 37.654 70.606-66.938-92.795-110.869-77.522-23.782c.133 8.312-.95 54.19-38.87 90.198l-26.088-26.206c-3.364 1.719-6.869 2.672-10.47 2.672-3.6 0-7.105-.954-10.47-2.672l-26.09 26.206c-41.855-39.745-38.827-91.519-38.827-91.519l-81.829 25.101L8.121 181.776l70.606 66.938 43.37-37.654v292.855h200.612'>",
            "<animate attributeName='opacity' dur='10s'  values='0.1; 0.5; 1; 2; 3; 5; 10; 20; 30; 100; 100; 100; 70; 20; 10; 5; 1; 0.5; 0.3; 0.1' repeatCount='indefinite' /></path>"
            "<path id='shoulder' fill='#4e4947' d='m133.732 113.467 58.946-18.082c-11.254-26.878-9.933-49.58-9.933-49.58l-81.828 25.101-92.796 110.87 38.159 36.176 87.452-104.485zm244.536 0-58.947-18.082c11.254-26.878 9.933-49.58 9.933-49.58l81.829 25.102 92.796 110.869-38.159 36.176-87.452-104.485z'/>",
            "<path id='numberOverlay' fill='rgba(255,255,255,0.25)' d='M211.686 366.145h-18.187c-7.143 0-12.935-5.792-12.935-12.935V249.732c0-7.143 5.792-12.935 12.935-12.935h125.002c7.143 0 12.935 5.792 12.935 12.935V353.21c0 7.143-5.792 12.935-12.935 12.935h-79.868'/>",
            "<path id='sideL' fill='rgba(96,91,92,0.269)' d='M 130 200 v305 h40' />",
            "<path id='sideR' fill='rgba(96,91,92,0.269)' d='M 382 200 v305 h-40' />",
            "<text id='league' style='font-family: Comic Sans MS; font-size:15; letter-spacing: 4.8px;' x='140' y='485' stroke='#000000' stroke-width='0.2' fill='rgba(255,255,255,0.65)'>Meta Cricket League",
                "<animate attributeName='opacity' dur='10s'  values='0; 0.1; 0.5; 1; 20; 30; 100; 100; 100; 1; 10; 5; 1; 0.5; 0.3; 0.1; 0' repeatCount='indefinite' /></text>"
        ));


    function getSliced(address mintAddress, uint256 start, uint256 end) pure public returns (string memory){
        string memory str = Strings.toHexString(uint160(mintAddress), 20);
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(end-start);

        for (uint256 i=start; i<end; i++){
            result[i-start] = strBytes[i];
        }

        return string(result);
    }
 
    function getJerseyColour(address mintAddress) pure public returns (string memory colour){
        string memory str = Strings.toHexString(uint160(mintAddress), 20);
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(6);

        result[0] = strBytes[2];
        result[1] = strBytes[3];
        result[2] = strBytes[11];
        result[3] = strBytes[31];
        result[4] = strBytes[40];
        result[5] = strBytes[41];

        colour = string(abi.encodePacked('#',string(result)));
    }


    function generate_inner(string memory jerseyColour) internal pure returns (string memory){
        return string(abi.encodePacked(
            "<rect x='-500' y='-500' width='500%' height='500%' fill='",jerseyColour,"' opacity='20%'>",
            INNER_SUFFIX
        ));
    }

    function generate_base_jersey(string memory jerseyColour) internal pure returns (string memory){
        return string(abi.encodePacked(
            "<path id='jersey' fill='",jerseyColour,
            JERSEY_SUFFIX
            
        ));
    }

    function generate_playerText(string memory playerName, string memory  token) internal pure returns (string memory){
        return string(abi.encodePacked(
            "<text id='number' style='font: bold 90px sans-serif; ' x='205' y='330' stroke='rgba(0,0,0,0.55)' stroke-width='4' fill='#ffffff'>",token,
                "<animate attributeName='opacity' dur='10s'  values='0; 0;0.1; 0.5; 0.7; 1; 10; 90; 100; 90; 60; 50; 10; 1; 0.5; 0.1; 0 ' repeatCount='indefinite' /></text>",
            "<g id='playerName'>",
                "<text id='Meta' style='font: bold 45px Comic Sans MS; letter-spacing: px' x='202' y='220' stroke='rgba(0,0,0,0.55)' stroke-width='2' fill='#ffffff'>Meta</text>",
                "<text id='Name' style='font: bold 45px Comic Sans MS; ' x='197' y='415' stroke='rgba(0,0,0,0.55)' stroke-width='2' fill='#ffffff'>",playerName,"</text>",
                "<animate attributeName='opacity' dur='10s'  values='0; 0; 0; 0; 0.1; 0.5; 0.7; 1; 10; 90; 100; 90; 50; 10; 1; 0.5; 0.1; 0 ' repeatCount='indefinite' />",
            "</g>"
            
        ));
    }

    function generate_AddressText(address mintAddress) internal pure returns (string memory){
        
        return string(abi.encodePacked(
            "<g id='Address' >",
                "<text transform='rotate(-50 50 200)' id='Name' style='font-family:  Monospace;font-size:12; letter-spacing: 1px;' x='50' y='200'  fill='#ffffff'>",getSliced(mintAddress,0,16),"</text>",
                "<text transform='rotate(-14 135 100)' id='Name' style='font-family:  Monospace;font-size:12; letter-spacing: 1px;' x='135' y='100'  fill='#ffffff'>",getSliced(mintAddress,16,21),"</text>",
                "<text transform='rotate(20, 340, 90)' id='Name' style='font-family:  Monospace;font-size:12; letter-spacing: 1px;' x='340' y='90'  fill='#ffffff'>",getSliced(mintAddress,21,26),"</text>",
                "<text transform='rotate(50, 380, 105)' id='Name' style='font-family:  Monospace;font-size:12; letter-spacing: 1px;' x='380' y='105'  fill='#ffffff'>",getSliced(mintAddress,26,42),"</text>",
                "<animate attributeName='opacity' dur='10s'  values='0; 0.1; 0.3; 0.5; 0.7; 1; 10; 90; 100; 90; 60; 50; 1; 0.5; 0.1; 0 ' repeatCount='indefinite' />"
            "</g>"
            )
        );
    }
    

    function generateSVG(string memory playerName, uint256 tokenId, address mintAddress) internal virtual view returns (string memory) {

        string memory token = tokenId.toString();
        if (tokenId < 10) token = string(abi.encodePacked('0',token));
        string memory jerseyColour = getJerseyColour(mintAddress);
        string memory finalSvg = string(abi.encodePacked(
            "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512' width='555' height='555'>",            
                generate_inner(jerseyColour),
                COLLAR,
                generate_base_jersey(jerseyColour),
                OUTLINE,
                generate_playerText(playerName, token),
                generate_AddressText(mintAddress),
            "</svg>"
        ));

        return finalSvg ;
    
    }

    function generateFinalMetaJson(string memory playerName , uint256 tokenId , address mintAddress) internal view returns (string memory){
        string memory finalSvg = generateSVG(playerName, tokenId, mintAddress);
        string memory nftName = string(abi.encodePacked("MCL Player #", tokenId.toString())) ;

        // Get all the JSON metadata in place and base64 encode it.
        string memory json = Base64.encode(
            bytes(string(
                    abi.encodePacked(
                        '{"name": "',nftName, '",',
                        ' "description": "MCL Collection of On-Chain-Jerseys.",',
                        // ' "image_data": "',finalSvg,'",',
                        ' "attributes": [{"trait_type":"Colour" , "value":"',getJerseyColour(mintAddress),'"},',
                        '                {"trait_type":"Level" , "value":',Strings.toString((tokenId/10)+1),'}, ',
                        // '                {"trait_type":"Stamina" , "value":"',Strings.toString(((tokenId/10)+1)*5),'"} ',
                        '                {"display_type": "number","trait_type":"Generation" , "value":1} ],',
                        '"image": "data:image/svg+xml;base64,',
                        // add data:image/svg+xml;base64 and then append our base64 encode our svg.
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        // prepend data:application/json;base64, to our data.
        string memory finalTokenUri = string(abi.encodePacked("data:application/json;base64,", json));
        return finalTokenUri;
    }    
}