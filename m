Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B62DA75B
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772312022; cv=none; b=KV1niRSAiLFPSN6o86ck49yGkSox0S2wgfYsRutEFnDOV9mDzqIzAVJkLFRGVDQXFxYcK2V9pU2mxIBVezS3a7OPrdcD29i2/ts8fL4t78GLGNwVcP8U1qBOGREwkrW101yIjepAl66snmDcCF7lHguTAjdesmUoNCz/DCEJHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772312022; c=relaxed/simple;
	bh=sO+L8pFDBw+JIOFpwfjVYJQY4ZLXgz84Y8vnXW8GS4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9M1wkLbFmY9OY9nCEZgz3NDutZnz+kExQKNniENYu2ErdovjPMmkpRrHjIgQ7XZN/+BGPsHIvcybzJBh+bMyzd1oc6qiCfBtp5R5XqcAcs0SOwLUPa/k6rB5kzuq7d+78ZxdX/gCH90luSzI5shOILJzrLEbDbAgeK6C7RnL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXA4f32C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXA4f32C"
Received: by smtp.kernel.org (Postfix)
	id DE698C19424; Sat, 28 Feb 2026 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958F8C116D0;
	Sat, 28 Feb 2026 20:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772312021;
	bh=sO+L8pFDBw+JIOFpwfjVYJQY4ZLXgz84Y8vnXW8GS4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXA4f32CggHg1CKmlWgoDMmJzcjWDNqFNTLsnRBtdEJuduvZw+uStGbTuFDKep1BI
	 HaHjvjsIewtPYtJIoE45IxOS0TAdUqvmGO4+J8xbHvKaqd47kWyYKJw0EPeuyJpLJg
	 cbcGD9vTo5IbKHvdtGtRm6FfiXjfjddd5Xj3gtYfqI5pmf2S6ckxEHNcgkavkxSh2r
	 j4Q4NXIHNVaAxbL4TblJVi9B2IOw2CSg9f9rZAlSKHlTB+ydp0kplRKBkCmOk5CoJZ
	 DSJ/f77MgMOozhaiUgwyv/+06ILgF20CWekUXoyp/5WszXnEAoZj4DK7wgYS45+eyE
	 IthYguxHh5Ivw==
Date: Sat, 28 Feb 2026 15:53:40 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-sceptical-fierce-swift-db217c@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
 <20260228-sparkling-beryl-kagu-8c34c8@lemur>
 <20260228151029-mutt-send-email-mst@kernel.org>
 <20260228-military-deer-of-purring-c9ef1b@lemur>
 <20260228154713-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228154713-mutt-send-email-mst@kernel.org>

On Sat, Feb 28, 2026 at 03:47:51PM -0500, Michael S. Tsirkin wrote:
> > Bah, that "--" was needed for Claude. /o\
> 
> at least for me, claude works without --. shrug.

Yes, but that's without passing --allowedTools, which takes a really complex
format with a ton of spaces. I may deprecate that in lieu of shipping policy
files instead.

> $ claude "say hello"
> 
>   ? for shortcuts                                                                                                          21722 tokens

Gotta say, that's probably world's least efficient "hello world". ;)

-- 
KR
