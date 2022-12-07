Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860C2107
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ScRcO2Bk/KuOlZg2PyKy2su18hxyR00jacDMWNe65O4=; b=V8GFx7YhYqG6jYNEMLlF/093aP
	FyClOa/6pJhKZSK9nir+p25sPI1fSM0whUZQwBgtCseYHUzR1O/n16iRBomCR9K3K+1L8AMDpvs7b
	UHqewOd3pAiuivu9PhXbSwOFhx1zICpVOGwbbx9gu+8XjYtIIVD/hC2iYT0bWf4wBkQ+X9diRv9z2
	5M1RB8SD80iLa8gwjbpPuX4qqzzeLRI+Gz5Vp+zir6Nqf8+Pv29nYvaErpGOgebmKdaorlfRcVZNM
	VZ7Cb0j6pSkbCG5AXNd07J7bEazAikhhps/D0OiEL55ZMMpL5maj+Cy2Y3VewI5ABxztd0tjO9Yvu
	CVdLPpFA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=53759)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <noralf@tronnes.org>)
	id 1p2xSQ-002r4R-Pa;
	Wed, 07 Dec 2022 17:39:43 +0100
Content-Type: multipart/mixed; boundary="------------ksMv2bdGtK00w8Ei4TiXN6dN"
Message-ID: <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
Date: Wed, 7 Dec 2022 17:39:40 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: new: b4 send --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>

This is a multi-part message in MIME format.
--------------ksMv2bdGtK00w8Ei4TiXN6dN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 06.12.2022 22.53, skrev Konstantin Ryabitsev:
> Hi, all:
> 
> Final feature before 0.11 (hopefully) -- there is a new test mode for b4 send
> that will only email the series to yourself instead of the actual destinations
> listed in "To" or "Cc" headers.
> 
> This should be particularly useful to anyone using the web submission
> endpoint, because this will allow them to see any post-processing that the
> remote will do to their patches (such as rewriting From: for DMARC purposes).
> 

I've always sent the patches to myself for a final check before sending
them off, so this is perfect.

But it doesn't work for me yet:

$ ~/projects/b4/b4.sh send --hide-cover-to-cc --reflect
Converted the branch to 1 messages
---
To: dri-devel@lists.freedesktop.org
    tzimmermann@suse.de
    kernel test robot <lkp@intel.com>
    Noralf Trønnes <noralf@tronnes.org>
---
  [PATCH] drm/gud: Fix missing include
---
Ready to:
  - send the above messages to just noralf@tronnes.org (REFLECT MODE)
  - via web endpoint: https://lkml.kernel.org/_b4_submit

Press Enter to proceed or Ctrl-C to abort
---
Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
Error from endpoint: This service only accepts patches
---
CRITICAL: Was not able to send messages.

$ ~/projects/b4/b4.sh --version
0.11.0-dev-b77ec

Cover letter:

$ git show 6c2812de7efe
commit 6c2812de7efe27951c95c9f736215675009da3fb
Author: Noralf Trønnes <noralf@tronnes.org>
Date:   Wed Dec 7 12:58:01 2022 +0100

    dummy
    Cc: dri-devel@lists.freedesktop.org
    Cc: tzimmermann@suse.de

    --- b4-submit-tracking ---
    # This section is used internally by b4 prep for tracking purposes.
    {
      "series": {
        "revision": 1,
        "change-id": "20221207-gud-missing-include-9ccf56382f8a",
        "base-branch": null
      }
    }

I've attached the 'b4 send --hide-cover-to-cc -o' output.

Noralf.
--------------ksMv2bdGtK00w8Ei4TiXN6dN
Content-Type: application/x-gzip; name="b4-gud-missing-include-1.tar.gz"
Content-Disposition: attachment; filename="b4-gud-missing-include-1.tar.gz"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA+2Va2/bNhSG81m/gui+tLBlk7rLqRo7tyZLnF7stGmHoaBESqYtiYpIOU6w
H7bv+2OjPDfrLU0xdBiK8QFsweSheHje99CxY2YNMQsmBCszk5VJ3hBqov7W9wMqfN9tn8h3
4YfP92whx3YcZPvIQ1sQ2cj3toD7HXO4k0ZIXAOwVbGvx903/4MS36V/K5JJ6mI9nbLVpyE9
WuTfuEcrsOc5d+lvW8i51d9x1Lga8JT+8F89+Yb/uf6HNS8G4IzXOE9BtNPI1Ax2LnemdbRn
R7tBWVKxE4HH5TpgKGvejvR4nT0x9rGkA/Caki6APtinCbCgZQHkD6xggFzQgQhCY9LEc5rI
Afjl+Wi6d/QrUJ7qK08NwCFbgY2pwMZUxvh4fGC+orVgvBwA1IPGHi8lLaU5va7UbpKuZL/K
MSu3QTLDtaAyWuf8d1yNS5HS2jwoE07UuwcgiJk0xlQInFHzWO38uE0UWdD/oveXyIQmiRGh
rgP9OEk+PvaUD9QZmEnokubDnAkpemlNKaFiIXnVBnWBvGFFQesCl+VQNIL2CO2CBa1Lmqsz
CAlqHnMJHueLashU4nkv4cWT7j8T4sIcY5bTegBiB8AeUmVrszNj36eJmt1vM+WVqsmEZSWW
Ta0quYzQNsARJZbrotAUM2y53jaQEfJ86NjQCdWvPAoQ3DYAiz7fdxuIaF1HZFnbYBalrZPE
Ru1iU21G1Op4Fk2uQ342RqP59bnM2JJMXqQ1Kk/PvYunaTbl6dHrxYkzSparfhK1K6Jnu6fz
ssqP+fF4fNPvP/Xfnhb8Ij/fy/fZDDc8iE/612ed+UsbP0ssCs/Dyfznk8pLy+eHwepoxU/n
43Bkn4VvfNcA0s3TxWJU7KU3F6Oryf5+Jq/eXh5dTvEL3J8EB/zwhFR+mPlpiOts9HT35HLx
UeFO6PXgjirc1lDlXS0iyEMmHEbIcpnXb+zrZ2fu5JUcxdnz8pWAp+kLMU8vX1pHy5sgMowR
Ibc9sCxwnvOkN3vfDT3DUD1CxQAkyCfQCTwYxil4+OC2hc4FBXJGgVKP8CugGqOkYEZzlfKD
R8ZLWvFaUmLGKvl7zWe05lDBPE3XCzZWnNZ//N4e9svWM03TaLthqVq2n1VNf5Na+3lXsYr2
EvAbQKBjqK9UmbTt2jJr7wykjiloLVWnP+w8MgzC0hSYZsYkwP17XhnfE2CwktAV8KzEsYnt
2RZxej2SIA+Hlme5xAHqavIcp83/3t2MTqdz/47DITDdrgc6btcHw6EBDPDTRkdVaVY2q35+
4/RmTz4fb0Tcjnc+Hb81xBfWXPF6cdnQhq5nP5xvc1Ofd1jygq0Xr1WKsaCm0rlg6i52MQmo
Z9M4xjZxMfRtGDs2CmBsQUgdRGkcOjBMjL/UUm08AF+9M8MkSV3PDqw0wIaxuzYZzXBNRFft
DoxvMtN//V+o0Wg0Go1Go9FoNBqNRqPRaDQajUaj0Wg0PzJ/AuU7D1gAKAAA

--------------ksMv2bdGtK00w8Ei4TiXN6dN--
