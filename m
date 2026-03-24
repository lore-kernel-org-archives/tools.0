Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62243EAC74
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352028; cv=none; b=NDIuVMlIUmiLD+ky9TY2ROOf6wsMzcKBPUgve7UBJ8rEki+Iti9yewXdb/e7j5zveeZ4TLhS832R5vsEfXvcX6nlehVKrq/tJP4kPhFzrqMKJl2Yqyocgy+Osh6JtDbqqY0D63HV8vu+BoZeoPgmbCeaXXWanoCUm63u944llK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352028; c=relaxed/simple;
	bh=/pHz7EKJnICDepmxVm+yzxVjVe8vQVoRFZH+3JJoLR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih36fUj+9qqq81sg+LSMhYl/vafu/3SLeezx/xAR4Lmyw3PlHyVdVVAWHt1b8P8azZjjeFTOzGoVVEd4cqtkhoiQTyJimRcpl7bmPAurH++W294z8T9+R1vPzogprEYSAi3URo6EtVueQB+dl93qfuMj+dD6g/3W3agQK1uIdkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlFmUB6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlFmUB6S"
Received: by smtp.kernel.org (Postfix)
	id 52534C2BCB2; Tue, 24 Mar 2026 11:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B20C19424;
	Tue, 24 Mar 2026 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774352028;
	bh=/pHz7EKJnICDepmxVm+yzxVjVe8vQVoRFZH+3JJoLR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlFmUB6SoXPzU2dz9KLm0lGonpuLIpXKW4PaI785E9SfRmGniSOT+owJmuvA/C1vG
	 KiiQSxop8P6MeQ7+7qhwXVWjblnTUev9tpx45dcv7JwHHwRTfOR+j4mHD+0j/l/dqO
	 sDvyUKtSNeo1wqxOzHIpp61aaveDp8O7HI9kM5q9qsHDHcIvUBFgrqvPHQR9jl0Z2k
	 3Ma2O5pwTe/Xl+2oLnAcxystwROGExV6FGAv3lPnQGzAoFSSyWr3BUvFGYaGcfaONv
	 o5v3Z/9Yw5ddTVX4UaqqYYE6ZnU9YapiS1pOk7VOfjC0jHoW/5qKLx9XtedhZLXVuH
	 UlFBqeAOlRdnA==
Date: Tue, 24 Mar 2026 12:33:44 +0100
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>
Subject: Re: [PATCH b4 1/3] shazam: refactor git_fetch_am_into_repo for
 deterministic worktree
Message-ID: <20260324-bedacht-suchhunde-4183380504e8@brauner>
References: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
 <20260306-master-v1-1-5a4b9cbe11d7@kernel.org>
 <177281341841.2006359.7114808279011252381@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177281341841.2006359.7114808279011252381@lemur>

On Fri, Mar 06, 2026 at 11:10:18AM -0500, Konstantin Ryabitsev wrote:
> On Fri, 06 Mar 2026 12:52:24 +0100, Christian Brauner <brauner@kernel.org> wrote:
> > Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
> > Signed-off-by: Christian Brauner <brauner@kernel.org>
> 
> I don't have general objections to the code, but I'm not fond of using 

Fwiw, I have not resend because the --resolve mechanism as it stands
silently removes the resolved patches as separate commits which is
obviously undesirable. What I basically need is a workflow where a
failed b4 shazam doesn't just unconditionally fail but let's me resolve
conflicts so that I can continue.

Thanks!
Christian
