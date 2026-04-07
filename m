Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654984AEE2
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573596; cv=none; b=B6xL7GgunPjOdmePwND7AYh06vPlYEWZCZ2+QWhi9T3OALZ8BjGxty+tt6DRv6hw6GGtDeCi4f2+7qbR1hYX05DPheqAiTW3Il3L2CoCauY9aA0X4zT+wV7yoPPkvYt6NcuFupq1zgm/TSMfsVZhUckk8Zx/7RyPqH44EYqamPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573596; c=relaxed/simple;
	bh=vePA0RVGLSpTsxRWmtosGmbbOcrMb/giwNYe1LuUTB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsjXbKF9suOslPbhS+SeZujqCh5WwDOCj/w1tEXtTZbliQhaIOEZlF8GhiysSgqB64LOrKRIBJSU+RT/MWFY2sQyuGhcoAgNmeQdb1IPh7Kvgs3YUKQR78y9TFAutIN5GDt8O8k933IEHa5Zs7EED6iXyVV2rWS+ICrSmfVLEqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jkPTNVP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jkPTNVP1"
Received: by smtp.kernel.org (Postfix)
	id 1E12AC19424; Tue,  7 Apr 2026 14:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DF9C116C6;
	Tue,  7 Apr 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775573596;
	bh=vePA0RVGLSpTsxRWmtosGmbbOcrMb/giwNYe1LuUTB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkPTNVP1pyg+quFYEW6EUBGsVKpdigI1z/bDa/k/WFw7cuB6ommwR1NXNjsS4u/O+
	 KY+L46QtpNv1NkxqX8/sW++vLr2ERocDfJdXmAh8hxQLXwkmiEf6jIwsCpnqAloa2E
	 irvozEb9U0LdhgEgkmoXUWVC43uYcSZ8BtMZFtpI=
Date: Tue, 7 Apr 2026 10:53:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, 
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review state is broken after series reorders patches?
Message-ID: <20260407-uppish-pretty-nautilus-886e00@lemur>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
 <177549837114.3355865.7109422546107942051.b4-reply@b4>
 <177550045089.3385816.4021244769990222254.b4-reply@b4>
 <5dfbf9fa-532c-47b3-95c1-4b14f6fed577@sirena.org.uk>
 <20260407-rampant-active-mongrel-b7ad0a@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-rampant-active-mongrel-b7ad0a@lemur>

On Tue, Apr 07, 2026 at 09:35:01AM -0400, Konstantin Ryabitsev wrote:
> > Is that a good idea - patches marked as skipped won't be applied will
> > they?
> 
> You are right, I forgot that we automatically default to cherry-picking when
> there are skipped patches. Let me revert that and think of a better approach.

Latest master takes a different approach -- we introduce a new "unchanged"
state that is only set when upgrading between revisions. Unchanged patches are
shown in a dimmer visual cue but are otherwise treated the same way as any
others.

Regards,
-- 
KR
