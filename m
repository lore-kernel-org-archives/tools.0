Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E71EB40
	for <tools@linux.kernel.org>; Tue, 21 May 2024 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716322311; cv=none; b=rZW0grxsY3J3eRxEHFfj+r4Fbw55HiCyhOQ8bcrADiAsTXYhQD2r6EUPS4WVG2MdUCSD/8odw33Vjq1Qf1kQnx7dX0C/0UJIN6JFUd0E8aK/AOg9sMrEfAOT2AZDGQXV9P2ddt8y4ssEXtUlVmrGIBk+QzdQXN8Zm5ULJbREQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716322311; c=relaxed/simple;
	bh=to7JHg0XwvLma0q5vCGsVJIM40L+Q2Xe2pfZl+v8+/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q9cG5KIf0MlUmmR1Jm69NoEDO0f7213WBIJqTJZ2dLPUkqm8j7XWG2NHcdSVBu4TzOjGUx+3fWkSBWMyznzlbQ/SHdCjlqOB4UUAbSjgAgB/4z8ulq7Rp9jJI1f/IZ0PhHwlmLKez4jhOm33ADkp3llCe8B7QZ/5fI7dFVuouJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gvk5apZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gvk5apZn"
Received: by smtp.kernel.org (Postfix)
	id 5F69DC32782; Tue, 21 May 2024 20:11:51 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DF92C2BD11
	for <tools@kernel.org>; Tue, 21 May 2024 20:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DF92C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716322308;
	bh=to7JHg0XwvLma0q5vCGsVJIM40L+Q2Xe2pfZl+v8+/Q=;
	h=Date:From:To:Cc:Subject:From;
	b=gvk5apZn+Et/EyHerHAv2asGXqSpS9T1iZ07Iv+eHcQuZ8SXqYLko7+Q25KNTOKrW
	 8tixgP+bfhSv8DSktrq/eMkJkTYukdZRtrgYIXKRBC0gcWguM1iHPYPtoAPW7oBUqt
	 O4KLL8AR1dECUsWcMkzcn/rdVqQGCJ8OjWIfWS4x0Md7cNKCqyJx6kbMosFrgauBtv
	 77D8wd5n328iT6NFNLhATVC1onOdwsAgxAHWbSPSlpy4gevqLTe6yK9ltqT9QoX2CX
	 QwpvZiLReG7j723a8yIpYazFCX3H7ZcH+GWwMXmCnjSUPtu3gE5OtJ6F+Fzi/ZEdvx
	 sBZRMxJyRx7PA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F3AF3782186;
	Tue, 21 May 2024 20:11:47 +0000 (UTC)
Date: Tue, 21 May 2024 16:11:45 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: /all/ vs /r/ URL for messages in lore
Message-ID: <e45742c0-45ae-4f6f-82ac-c59bea4c9304@notapiano>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I've noticed that in addition to the 'all' inbox in lore,
https://lore.kernel.org/all/, there's also a hidden 'r' inbox,
https://lore.kernel.org/r/, that seems to redirect to 'all'. I've seen mixed
usage of both in the kernel documentation and am wondering if one should be
prefered over the other.

Is the 'r' inbox even meant to be used? I'm worried it might not be "officially
supported" and stop working in the future.

In any case I think it would be good to choose one and use it consistently
throughout the documentation.

Thanks,
Nícolas
