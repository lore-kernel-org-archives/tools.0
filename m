Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706925;
	b=LlWKdqB+i37nOgXAZJeC4Qt2dEce9bkyTA1mzbqz3KaR8k+Vu9nbtEn0wz8Zn4XoH8cA
	 7LJVoDzy7nBpUhHw/5Ir4mGpI9EoigiIWDFVlAn6kyIpQ6G5HoR3ImEsjS6W4ubdlSu12
	 WQGOKAGW+ppUGFFfo/TX6oJgH2bMiBxGyLJx0305h2p8+e6LGMIfXS9/QLFxqaOk8oKeF
	 vfybJhC6Z+dbG74LdjgCV6fABH9VZlr3hcDAT342idO46spYFOAWOmckwmR5cc08i31ZZ
	 8nqznNoX/B6K2YpqAt5B37GS0THdnI2wWifbqesN8eyEJ16KyFZCUNyBDry0xZY1AkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706925;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QeKpt5h9cQaCimJFgZaHAzjAd/6GI5uegJ/yJ7Fwso0=;
	b=phLPcm8ofStUaElJpu6eK2nOtWUTpAChobICVRamz4gBuG5gAfCX0TifnxfYstJMLLaD
	 10uprwaLwmAR5vra+ORJepUyZYXpmTBHxZwhOSxVGPUmVOw0DL6lOzyCD8/1V4/D2mme1
	 WgnM2wiABqi4d3gyE8aAa2JkykfhugUzgWbcXJ3ptuccMoP5Jw6X1EZkEk99yZZsMCa6v
	 Vz/dkJ8TDzYIM4gTn6faSw80AfhLJBL8iAP4ESL1IFU4y9WvGO1CPZEAt+ibY8fFoDhea
	 pCtzxNTfaFvNAjVTRwRxZq5Ay5vdPtxy3T2hDe1St2H1hChf0FViTNwlwxNTvgynyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="exb/jx8c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F0606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=exb/jx8c
Received: by smtp.kernel.org (Postfix)
	id D62041F000C0; Thu, 26 Nov 2026 15:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894121F000C4;
	Thu, 26 Nov 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795706924;
	bh=QeKpt5h9cQaCimJFgZaHAzjAd/6GI5uegJ/yJ7Fwso0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=exb/jx8cLADTMfogp27Ay+C3lLqBc9vteZg3ehg/IrU3dYHBtecQZY05rS6GQjTTB
	 kPIOLn2TSjthCuXUqF5hAzn0bj0wWNN38LHFmnQ/c523Y3HyeNCWDCaSR3G6viAp2/
	 ic6ZVeRmteoC6TEl8RjQRSyBWgHliGhUZ/P1acX4=
Date: Thu, 26 Nov 2026 10:28:43 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4 v2] review: Add a batch mode for agent reviews
Message-ID: <20261126-colossal-azure-bustard-f6bfde@toolbx>
References: <20261117-batch-agent-v2-1-d42998f95590@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117-batch-agent-v2-1-d42998f95590@kernel.org>

On Tue, Nov 17, 2026 at 01:07:42AM +0000, Mark Brown wrote:
> Agent reviews can take quite some time to run which is not ideal for
> interactive use. Add a command 'b4 review batch agent' which runs an agent
> review for everything that is currently in reviewing state, allowing users
> to ingest a batch of patches then review them all non-interactively.
> Allow this to be limited to a specific agent in case the user is working
> with multiple agents and wants to use them all.
> 
> A separate agent command can be supplied for this mode, allowing the
> user to have both interactive and non-interactive sessions, and a
> substitution {review_dir} is provided to make permissions management
> easier.
> 
> There is a plan to offer batch operations on tagged commits in the TUI but
> this feels like a case that's worth handling separately.  As well as the
> particularly long runtimes compared to other things that b4 does users
> may also wish to do them in an isolated environment (or an environment
> with better connectivity for that matter) so a mechanism for running
> things non-interactively could be beneficial.

Thanks! I made some changes to better fit with the plans I have for the
workbooks and batch operation mode. Please test out the master to make sure
it's still doing what you need it to do.

-K
