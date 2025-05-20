Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF02609C4
	for <tools@linux.kernel.org>; Tue, 20 May 2025 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780506; cv=none; b=uPXbGC9KrCFEISArmvRjH/GLYP5Qbe1/e1mvCrjVOpKujfIJkSgPMBdsLzfgL5U+rrvsSHP8evcwwx/WZ/8e9par923cVxGVN5DYyIhxA/HQ+/JD96wWnd1ApW6IIxXfqNlH+EF5eq9YxOLC6IwuDYxCWScC+pwnEkOEDJJcgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780506; c=relaxed/simple;
	bh=Vg68Rt+0evcFSSjTW58a3A/RXYo+L+pezfDP3CXzaa0=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=ou8mJ/E2vKVJzDl9OrWaNukZcGxq/g78u5JmOkSiUd+NQ+Xau8KVvBF1Ks7mT4XrOg3QxOW7uY+bUsch7u8t04+O18/yPKbWRKA0Es1DYMw/acX+lMDId4klJ26qB6yD6Xv8TE3uMIqNt/6eiVPBarmbUClPRS3cJvNI7LjytbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicklogowebsitedesigning.com header.i=@quicklogowebsitedesigning.com header.b=LkiM+DUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicklogowebsitedesigning.com header.i=@quicklogowebsitedesigning.com header.b="LkiM+DUZ"
Received: by smtp.kernel.org (Postfix)
	id 8D3A7C4CEED; Tue, 20 May 2025 22:35:05 +0000 (UTC)
Received: from host.quicklogowebsitedesigning.com (host.quicklogowebsitedesigning.com [103.133.214.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA511C4CEF1
	for <tools@kernel.org>; Tue, 20 May 2025 22:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA511C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicklogowebsitedesigning.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicklogowebsitedesigning.com
Received: from quicklogowebsitedesigning.com (localhost [IPv6:::1])
	by host.quicklogowebsitedesigning.com (Postfix) with ESMTPA id 8B79617D74B
	for <tools@kernel.org>; Wed, 21 May 2025 03:53:04 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 host.quicklogowebsitedesigning.com 8B79617D74B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=quicklogowebsitedesigning.com; s=202407; t=1747779784;
	bh=h3Re4ZyxmIjLjbC3kGNe4/eRd55jarqXuwjXB2zIetQ=;
	h=Date:From:To:Subject:From;
	b=LkiM+DUZ2FttLIOD40g9UttX1cxMSeyMH+plZ+VyjtWxQP/IVFghK2S6gzTkdlpCY
	 l1OihUXIT8apgc3Joh21Lzag0YJYsIXi0A3WZ7fIexfoGAccRKR8iSRgoBAwdcQYG1
	 2PExkVfJoGMsB2maI6y8fzYGlJ/PzimfK6lPQxkEbX7JYI5KXgvUd7jyqRNVZuQ4dz
	 yXQF0u2lHzXqMRPpjGWOGdnF/jS7rIopzAuP8uzRFYmQRGB6rGkxRGu7pZdiVudD0i
	 4X0cEcdl+v5iZIm7E2c49B9EUgBbLadg6Uf7Uhpr3TU2bnlf5H8YNTurYeocLW1z91
	 uPssAdZ460xBQ==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 May 2025 03:53:04 +0530
From: celina.jones@quicklogowebsitedesigning.com
To: tools@kernel.org
Subject: Audio & Video Transcription / Translation Service at 70 cents/min
Message-ID: <8a40a264f1f1df2566b5f859b5445e20@quicklogowebsitedesigning.com>
X-Sender: celina.jones@quicklogowebsitedesigning.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello,

  Are you looking for a transcriber / translator for transcribing your 
audios / videos ? Many researchers / students are not aware of who to 
reach out to get their research audios and videos transcribed with 
confidentiality.

  We have been working for university students across the globe for over 
10 years now and provide transcription service to students, researchers, 
coaches, news agencies / reporters, writers at a very reasonable cost 
and quick turnaround.

  Whether it's interviews, podcasts, meetings, or lectures, we can 
quickly and accurately convert your audio / video into a written format.

  Our rates start at USD 0.70 per audio / video minute for up to 3 
different voices in the audio / video.

  Should you be interested, please do feel free to reach out for a free 
sample transcript of any audio / video of your choice.

  In addition, we also provide service for logo / graphic designing, 
website designing and development or any kind of software development as 
well. Please feel free to ask for our portfolio.

  Regards,
  Celina Jones
