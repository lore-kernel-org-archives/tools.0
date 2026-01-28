Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC3320CCF
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626743; cv=none; b=JDqBREmFBWjGMGuadnJIztvL3Z1EUnlD07uzaiy4SIWOt4d+PKDoGPwcIK5288hfJcbbs7uNVRZcBLq62y35z6qSGcfXmpllOG1TYDyBaijCLwM4KFtJ+OVfs5AxlHtgnf5IFrIkW87M8eG8rknKvy0Ee2BlYzpDHpEP3VkwHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626743; c=relaxed/simple;
	bh=k+AU57A2JdzJDadhEcy1gWRJ5lJM72wurLY1WmnxDXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HReLwXOPMKC6ZSeV/t2z0F6DC7VDYtXblJvZa+dQjdkPF5fBI1Pc0NC0vm5yCRq/zuLJmJ+UMmiQyOGZrgJl/2nqB9HqeCfHYLBgPmBs/S6AjyEVj9SnwxnBuGY+m5Gz3UPfVPpVDYGTQvM/IXMcZsJw2/bchfgbI2qgqeH9PWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErMwS44e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErMwS44e"
Received: by smtp.kernel.org (Postfix)
	id 5C746C4CEF7; Wed, 28 Jan 2026 18:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B080C4CEF1;
	Wed, 28 Jan 2026 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626743;
	bh=k+AU57A2JdzJDadhEcy1gWRJ5lJM72wurLY1WmnxDXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErMwS44ehW6etzcE43ESvaAkKXot+lVoUsk+Rp4a9t9Frymv8iUVbbkHfBkkLXHnj
	 6jyCBJmXccBa2xKNGp0LA0PdMVFDnXaJov7JYEVuBAYtRDWZ92yglbI113VFAMfgG+
	 gMr4PY1Rj+DCjgfALnct9FetIoeBl+C7wzg2sTfhGopULd9eRySohJcr1GZwrt72GM
	 WAfWfClO6/qknimAS78Em742gPVGHfLOD8PmUQvHGdxumzVKxaUV/FBU7HsmiyhEgs
	 4WO6pMEZQHhlPSNof5GHR53ESfm3Roqub4Gj/r2pepvfcOCuj3FssYQaHOhU63J2/K
	 DffehbDSpA4YQ==
Date: Wed, 28 Jan 2026 13:59:01 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl track-subsystem --forget confusion
Message-ID: <20260128-cerulean-grebe-of-symmetry-ab2ab8@lemur>
References: <39d09de1-8756-4b51-a4b8-c5d9c8fb1676@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39d09de1-8756-4b51-a4b8-c5d9c8fb1676@sirena.org.uk>

On Wed, Jan 28, 2026 at 06:01:26PM +0000, Mark Brown wrote:
> Hi,
> 
> If I do
> 
>    $ kgl track-subsystem 'REGISTER MAP'
> 
> the config file is created as:
> 
>    Configuration written to: /home/broonie/.config/korgalore/conf.d/register_map_abstraction.toml 
> 
> but if I then try to forget that configuration with --forget the
> configuraiton file is left behind since it tries to remove a name based
> on the exact arguments I supplied:
> 
>    $ kgl track-subsystem --forget 'REGISTER MAP'
>    warning: Config file not found: /home/broonie/.config/korgalore/conf.d/register_map.toml
>    Removed tracking for subsystem: REGISTER MAP

The master branch should do the right thing now, and you should also be able
to run `kgl track-subsystem --list` to list all the subsystems you're
tracking.

Thanks for the report!

-K
