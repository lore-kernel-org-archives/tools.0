Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5818D4AE
	for <tools@linux.kernel.org>; Mon, 29 Jul 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287297; cv=none; b=gF4iaH0wiqM+JAYy/spqe+j8C7HKLyYJRGupEAr5bQQzxTgxKm2UAOEGEv3BQQtA3ggmMu3r5VLeKK17sUNdoHdLRUmOzme698its/xga36kskcyxL88OcKhc3BWrxtapEMT2bMVTMBhygA0oRGUHy/GmPA9d1T/2WWFqHsg950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287297; c=relaxed/simple;
	bh=++Ic7VBhVgwqBCwcEq1IVlv6lsvHzE0wYH6l/9revfU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lONDMo7MWS9fxQ/k6r9J60fEJj6AN5byi2z+ee1WTlhnWH/o/MalCGTCYBQWOR4auJVoVnr7M9YoiJG3xq1QMNOsiNYBD2+bhuQgu53VRw4RQLc4JVntN4V0gZJh7gEL2jr3AXjM6FhSlMks4nEXytQjPwHOw51x24JFqJBwg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D62EFC4AF09; Mon, 29 Jul 2024 21:08:16 +0000 (UTC)
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E084C32786
	for <tools@kernel.org>; Mon, 29 Jul 2024 21:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E084C32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id BFDF582D1F
	for <tools@kernel.org>; Mon, 29 Jul 2024 23:08:02 +0200 (CEST)
From: Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: tools@kernel.org
Subject: Can't reauthorize with endpoint using new GPG key
Date: Mon, 29 Jul 2024 23:07:41 +0200
Message-ID: <5827210.DvuYhMxLoT@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje.mihanovic@skole.hr;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi,

After replacing my GPG key, I was unable to reflect a patch series with the 
following error:

Error from endpoint: No matching key, please complete web auth first.

When I run `b4 send --web-auth-new`, I get the following error:

500 response from the endpoint: {"result": "error", "message": 
"i=duje.mihanovic@skole.hr;s=default is already authorized"}

After doing some short digging around b4 and korg documentation I couldn't 
find a way to revoke the old authorization and be able to use my new GPG key. 
Is there a way to do this?

Regards,
-- 
Duje



