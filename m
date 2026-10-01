Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A144C33FA
	for <tools@linux.kernel.org>; Thu,  1 Oct 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842964; cv=none; b=f5e2olcqwJbm0zGBgV9vlfrxqhL+mNJPKhUpRVz0nOrWXz+TTj8BNrkALtxMTVERpBdudAwyKbJj3G1mvRV4F6j1tF+NkeeJopaA2dLn2V3/Srg5svjPc7FsydbIcvSTJTM0ngVopPgOywWQlPpsI0WgMJCpqVh9VQnCRVmiB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842964; c=relaxed/simple;
	bh=EGueo0YC58ayKMhAoUzVjwwQGOFaBxm7Rs/XlNH1pc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJ8OidNVDpbmLqaT44YE+k9vakUszRtL48JulXITkQ6M461DEnb/EQtKsszbUhBooIZzAv+c3GisC+czw4A/PZvvRsoc3f60iAlljsoG+Z6TkXC206n8S0Ph07MFnJdq6NnqCf4a0ECM9bZpsG/9hrxqHQUDsdFgZk6p7fwEZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eEMyEoRq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eEMyEoRq"
Received: by smtp.kernel.org (Postfix)
	id C38CF1F0089C; Thu,  1 Oct 2026 08:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C55E1F000FF;
	Thu,  1 Oct 2026 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790842958;
	bh=NHAkIZJArzpCAVwG82XQpbFua3euyFuQXgTHr7Bhfh8=;
	h=Date:From:To:Cc:Subject;
	b=eEMyEoRqxqp3fcVYxPScgsw+Po7App+A7JBdAhHrnXtm9N/OGoXBVudkKsusZhaC1
	 RrvyGVI2CmEGyOKCfd79KKZdhEDgJ6Htn1tz26A0zXR83CER4vFfyNDZnri73cPolc
	 prmDwq3P+Ik+3r29PiUn7dejhyybatS2Oz6K2G0U=
Date: Thu, 1 Oct 2026 10:22:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: b4 getting confused about lots of versions for a single patch
Message-ID: <2026100127-diving-unbundle-fb1c@gregkh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Running the git version of b4 seems to pick the "wrong" patch in this
series:
	https://lore.kernel.org/r/20260915110637.17658-1-jiazi.liu1984@gmail.com
it grabs the "v3 version" despite it saying it picked the v4 version,
when really the v5 version is the "right" one:

	Looking up 20260915110637.17658-1-jiazi.liu1984@gmail.com
	Analyzing 16 messages in the thread
	Assuming new revision: v5 ([PATCH v3] usb: dwc3: gadget: fix IRQ storm on invalid event buffer count)
	Looking for additional code-review trailers on lore.kernel.org
	Analyzing 5 code-review messages
	Will use the latest revision: v4
	You can pick other revisions using the -vN flag
	Checking attestation on all messages, may take a moment...
	---
	  ✗ [PATCH v4] usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
	    + Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> (✓ DKIM/synopsys.com)
	  ---
	  ✗ BADSIG: DKIM/gmail.com
	---
	Total patches: 1
	---
	 Link: https://patch.msgid.link/20260907073756.22329-1-jiazi.liu1984@gmail.com
	Applying: usb: dwc3: gadget: fix IRQ storm on invalid event buffer count

Any ideas?

thanks,

greg k-h
