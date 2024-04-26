Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC72B9AF
	for <tools@linux.kernel.org>; Fri, 26 Apr 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714149877; cv=none; b=QeU36kiA0l0t1E+f7VTJRX0QTIL/onmxrYHx55Qp03AcKvNKHuGHG7Wn3WlXwQSvs1FGxjPqD1wBhb/EXHilT8LD7WTrRIRGXnlFIZTzRjmsYpNfSy6wufiVMgPi8Aq47khAKo1Y4JNuNJ6XANxlxAB8m7YuTwtJrTmrNqyqmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714149877; c=relaxed/simple;
	bh=59CCLi1Qur1Y5zwRcnI1oWIR227ADb8PqG5F5fr3phw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R74RyRLN1ym9grJ88VkS/oZxeWVOm5bQvlDf8dq5UyPgjCCIr8xZ6vkAJChpb7luEjPNtwb2xHz8pdERggPQ6/ZG5LWhcQJUEl7a9CJe650XGFhD4nJwWLoJ3oYUoXuhEnZzFmQqgcjP7VTXx6uWWAeiLFwpYGMqh+g/TAkB2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GFFv4a7O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GFFv4a7O"
Received: by smtp.kernel.org (Postfix)
	id 4F9EAC113CD; Fri, 26 Apr 2024 16:44:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B36DC2BD10
	for <tools@kernel.org>; Fri, 26 Apr 2024 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B36DC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7D460003;
	Fri, 26 Apr 2024 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714149867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2uc4lZGWnsDZ5L4lx1rg//dyyuoHBaC7usmYGsiZLs=;
	b=GFFv4a7OcsHX7DfxvfTa5yP3jIQ2hqwtNPYQP1IkVaS5FiYzRLcFcHTH8HpNesck6As5+S
	4OeEt3qPw7BPq7e7DYgAIekAk2Irw8W3ZqmJ14hDTbSAEvU0OuL50QN5HP18lFYZqD3YCw
	MMTD6GGvjNMzHrVZ1E1jIwGQvfcfE+3T5iEcilprkYuFtxUSTvG4Zi5tHx3BdLUgl9HwHj
	AgIjTg0h6o3RJhaq4B3LiAz/5Fini+Mz0j5z67f4dIdH8RDvA1pKyuainO8K6gZ9mR03aQ
	q69aSCA4SUR0toVYfgPaPKBsMCyYG6FSudkoS2nLsVg4TowJgRJNPj7UHmlUPg==
Date: Fri, 26 Apr 2024 18:44:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4: use new trailers in 'b4 send --resend'
Message-ID: <20240426184425.23b606bf@booty>
In-Reply-To: <20240426-jasper-sloth-from-neptune-82a6f7@lemur>
References: <20240426140157.349783d6@booty>
	<20240426-jasper-sloth-from-neptune-82a6f7@lemur>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Konstantin,

thanks for your quick feedback.

On Fri, 26 Apr 2024 11:11:29 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Fri, Apr 26, 2024 at 02:01:57PM GMT, Luca Ceresoli wrote:
> > first of all: thanks for b4, I love it when sending my patches!
> > 
> > I found a little issue when resending a patch series with unmodified
> > content, but with new trailers received after the initial sending.
> > 
> > This are the events involved:
> > 
> >  1. send a patch series (b4 send)
> >  2. receive some Reviewed-by, but patch not applied and no changes
> >     needed
> >  3. update trailers (b4 trailers -u)
> >  4. resend (b4 send --resend)
> > 
> > At step 4 I would expect b4 to prepare a [PATCH RESEND] series with
> > the new trailers added. Instead b4 resends the exact same series,
> > without any new trailers.  
> 
> This is the expected behaviour, as far as I know. There should be no 
> differences between the series, otherwise it's not really a resend.
> 
> It's not really necessary to resend a series just for trailer changes 
> anyway. The maintainer will most likely use b4 to retrieve it anyway, 
> and that will pull in any new trailers.

I cannot recall exactly when it did happen and provide a link right now,
but I clearly remember having been asked by some maintainer to do
exactly this, instead of pinging.

The rationale is that sending a new version just to add review tags was
considered bad because one can expect the patches or commit description
to have changed somewhat, which it hasn't.

OTOH resending without new trailers can lead to applying a patch
without those tags (not recognizing reviewers time), or even worse to
discard a patch because it does not show the needed tags.

It all made sense to me. Does it look reasonable to you too, with this
extra explanation?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
