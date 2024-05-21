Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE01147C6F
	for <tools@linux.kernel.org>; Tue, 21 May 2024 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312265; cv=none; b=PJrl+lRa7+KR+I+5P7PyzsAp2vVgg32vVpooKaKW+pwMCgjlzhHC2JMo5CRiLQqqaCNEJff1Nl1akZdpdqzeq7Dix+J/JXBMFov2Zi8L1cgOchToAOrxt0oAEVY1jvYjsEUn+00teKJoAaCFDuDyckupMi5qc60aMuQFKKTV2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312265; c=relaxed/simple;
	bh=E8eOefiOA20FyRhE4zls80dQmC9+0iISQAeH++5uSvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irFPI7Ow5sEI1BckNUzFU7Aojf8t6F22jq8lgr7txwS5L338jZMMfIR7jH1ctts3V135Pr1HA1SeMaRYqPd0f6jxMZBaBhTfidsf9MmDzp6mk6DNlC13LxsC46MhBVr2xr12eqdmDCLlUToHGCN52xG3V6GB694iYrgCGluAtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nn2wVIS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nn2wVIS5"
Received: by smtp.kernel.org (Postfix)
	id 2FEEEC32782; Tue, 21 May 2024 17:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8036C2BD11;
	Tue, 21 May 2024 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716312265;
	bh=E8eOefiOA20FyRhE4zls80dQmC9+0iISQAeH++5uSvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nn2wVIS56oQBx7P9INaaQqkikZoJY+ifqNw4g+uQAw2OV/QcVTGAYTWrBv+CHAiIQ
	 qfUtYoSa7ppfGq1HzwmIc8SWTE7KiAdtBCA4wlBXjT5mDP8ltIIh+MmCiX4Lq+zex4
	 cXSxZlY5FJmykHv2Elg7q8szhG/J0kn6dph3Xjo8=
Date: Tue, 21 May 2024 13:24:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 2/2] ez: Fix check-deps when strategy is commit
Message-ID: <20240521-optimistic-vigorous-waxbill-a95439@lemur>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
 <20240521-fix-check-deps-v1-2-d149bf40e7ee@bootlin.com>
 <20240521-amusing-ant-of-correction-7b6ca7@lemur>
 <ZkzA0rnt8wgc7YB6@localhost.localdomain>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZkzA0rnt8wgc7YB6@localhost.localdomain>

On Tue, May 21, 2024 at 05:42:10PM GMT, Louis Chauvet wrote:
> If I understood correctly the code, the cover is removed at line 1408, 
> but re-added at 1545 if the series contains multiple patches:

Yes, you're right -- my test case only had a single patch. Thanks for 
catching this.

-K
