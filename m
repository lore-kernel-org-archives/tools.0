Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AE1482F3
	for <tools@linux.kernel.org>; Fri, 27 Dec 2024 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735313272; cv=none; b=kAU3S1158pYcyJuAznHVufYbwmjd4riBqXn/9mOQ4IDxw6Z2gZihuizJiSn7B8j2PmuRYwgexCALtnOjk0z0RPyhKoio1ibi1LNGeKeyDdSUf/7xWXs43OPaqfAz6fmWcy3ftGVHKIk+SZge2AC4w6or2gjle97+CykjTQepmeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735313272; c=relaxed/simple;
	bh=bDWiJqTWCdjQToAbWIDPYDg7wJdVAO4hZ9x3VCAz7UY=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=mbzuPkES5btwU1LJX3fFyh6VucF5dOYDVxcpWzFEH4h27wKa78soJOw8vJVx4RHCBPSLd23zHVtVm7b6cXw4OoC1C2xSXSZFYtfHXJmSm5ZZLccl/EK5RIgNVhS7lEbuo0llBL4jL0s9wa9B5cLD584ELTzp9uFCDRSA+igPajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=pPD0wMZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="pPD0wMZs"
Received: by smtp.kernel.org (Postfix)
	id D3735C4CED3; Fri, 27 Dec 2024 15:27:51 +0000 (UTC)
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7BF8C4CED0
	for <tools@kernel.org>; Fri, 27 Dec 2024 15:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7BF8C4CED0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id Qtf4tZoUAnNFGRCFftYcZE; Fri, 27 Dec 2024 15:27:47 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id RCFctUp0CCgT6RCFetm0v9; Fri, 27 Dec 2024 15:27:47 +0000
X-Authority-Analysis: v=2.4 cv=XvwxOkF9 c=1 sm=1 tr=0 ts=676ec773
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=vU9dKmh3AAAA:8 a=9ljd86bzAAAA:8 a=S3tBI1c1Ave0Ix2cU0EA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:Cc:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bDWiJqTWCdjQToAbWIDPYDg7wJdVAO4hZ9x3VCAz7UY=; b=pPD0wMZscGgoM80QiGPp8r4aWO
	XQ+8ugRbdTNaKbWZBLI1Y3CK2DFiABiDk1E0Xi9RonedSehSTCxSvvW5ChHefT/FykY/1+Ee85Vgy
	xNNoPfQakaLw40QaCCX+VqCtyY6LbOPp/YtbDca/XRn/HJGQQSfRACSDcagLwk/fJX9uwYXH6r9jw
	hBod9ymmvbrzk13/YFE9TSDR/XxfIoZEincLj7Jey1qRwh3zVQVLIV9onug4dy90ldLXm9CsXhkIs
	U7QpleQkHhwSvuRsZIa/hP0ejHHAiHM/YnozLDvkB+0n+WMiVsqMIRCIeI+IOUZ59eM/JCljSeJUS
	VBX3nEpA==;
Received: from [122.165.245.213] (port=56246 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tRCFc-0049iz-0p;
	Fri, 27 Dec 2024 20:57:44 +0530
Message-ID: <9d1b7631-3d8b-46b0-b4b3-dec9ab989947@linumiz.com>
Date: Fri, 27 Dec 2024 20:57:41 +0530
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com
Content-Language: en-US
To: tools@kernel.org
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
Subject: Configure email count/limit
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tRCFc-0049iz-0p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:56246
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 1
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPZrrKIHMdGp+k72qMlisWy3bWABwC3/KipzMrHnHvEAqFzSxmiSxrssSXul6gtxvCpnbwKWt3SaSAC510hnSH4bZOYWe/x7fUWNb5Y0pdQT75X/nfbp
 Y2tTN24CzV+0rxRlawKz5931snnvb+7CfV/sMQ2od9/KLgrqGBzKyS5ge77vsQc+XuNiagIdQv2so/DYgs+H/A75bTxM0gteXCg=

Good day,

Today when sending [1] to the kernel list the domain limit [2] exceeded
and the series wasn't complete. I see similar limitations in other shared
hosting servers.

Will it be possible to limit based on internal or time when using "b4 send"?

[1]: https://lore.kernel.org/linux-sunxi/20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com/
[2]: https://www.hostgator.com/tos/mailpolicy

Thanks,
Parthiban
