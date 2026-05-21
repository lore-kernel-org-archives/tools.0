Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968EF312831
	for <tools@linux.kernel.org>; Thu, 21 May 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373907; cv=none; b=m32gyYqZy/cbjZqWkbNfFBDWnNwv27rhUFXv/Z8epIfc5h5n3czUIb4A5iL9qP001hVCGDxKj2TuKbkmzA1ZFcKN2u5MaaleO7T3GL642ViT7LR0pJkk1ohb8bf81lZTD3mSEbT+EEUFd5FG4iO+LUf0EG9xYkspVqdaD3Gc3mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373907; c=relaxed/simple;
	bh=o8BR3PWx/f2AsJwxCyn1CDYxtsEvXRTPLH0C1+qiiR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5QCQgnqQWJ9de2QJrz7lw5y9Jrfup3qEt17g/RkHhrR2AzuDN11vuylP5GRo5+VR4lVeVLvEK5+G8SO4MeYunXvvOCrMvlDjBokg0yWJ/Z3WsSn2J3AuxyJWtZspGjHbxvPKfks7GO2X/wrae3oq0NKMktViV1h3L7eJdMJ/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUuWMpp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUuWMpp4"
Received: by smtp.kernel.org (Postfix)
	id 4B2E41F00A3B; Thu, 21 May 2026 14:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFECD1F000E9;
	Thu, 21 May 2026 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779373906;
	bh=nmkXi4qNdJ0QSGAdt5C7Q0xnjRgTSC2ANrrbb8F3p10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUuWMpp4R5Dimbvr0eZp6oGuQPZNIV/A3TZV+Bk2AO6q7O93/uZmpfcV2aIfRLIOr
	 y/IRe5mhGz8z1dT7IQcR9J6xlEhp1fcEREOwJlbwaG9KiG6XWF5lS+OUYuy3r8eZ9B
	 IGJtJmegWv02FAbuRtkK40fkOlux8dczKqdUVobKgu94k6X4JA7hZ0q1fGgxkG3CJB
	 i29rmT02QKgGRz8bvgk9D+PqqmOBTSAwdjkcKcxa10E2YdpReYQXY+AiZhxY0e2qx7
	 Vu4xnw/9qWqyM6A985Ilz6j1hLODbOj6NNVCLxmxZSeF+guC6vK8UA1cleodS4rWLM
	 4qj1bfMArbxew==
Date: Thu, 21 May 2026 10:31:44 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521-chirpy-hot-cassowary-5df4ff@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
 <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
 <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>

On Wed, May 20, 2026 at 08:58:53PM -0700, Borislav Petkov wrote:
> config file has:
> 
> [targets.local]
> type = 'maildir'
> path = '~/Mail/lkml'
> 
> ### Deliveries ###
> 
> [deliveries.lkml]
> feed = 'https://lore.kernel.org/lkml'
> target = 'local'
> labels = ['LKML']
> 
> I.e., nothing special.
> 
> > Yes, I'd like to troubleshoot this further, assuming you want each and every
> > one of those 34277 new messages. :)
> 
> Yeah, I had deleted the maildir directories cur,tmp,new in ~/Mail/lkml as
> I was trying to make it refetch everything.
> 
> After doing:
> 
> mkdir cur tmp new
> 
> it works now.

Right, a maildir must, by definition, have these directories, otherwise it's
just a dir. We're not currently handling the situation where a maildir is not
strictly valid, but I'll consider if we should.

Thanks!

-K
