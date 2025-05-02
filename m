Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93022A7E5
	for <tools@linux.kernel.org>; Fri,  2 May 2025 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173925; cv=none; b=ZBtb6C1bHYjMAVyFT5XdCDxOAaPw/39xq8MbSAwxYYZTESwWGbZNcYnJOEnogOh1cHfDcQ+dIEXd1t7/EYCDs+QTi+pTTetfMXL8fXAcvlTE8B0JYoHnaN6ypDEGJASHcsR9bSr8INRiNsdFN8XdrgVn6E5Rdb8MMn6/aQAmLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173925; c=relaxed/simple;
	bh=xYssf4LOgq0VNhC5INmCIVgWeSTMotc+cQY5inXoXj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMesyu831NkBVrHL3rrR2WTfjhskYf6zhJSQ+gJxkOvehGxZq/7vvU5Jg41XXzR+IHGY5aI8lABeW2frfNp11KiMJPlNADu0JHcA5ARYtDZ11vL5g1Dqhnt2XfZ42ubsRaJHEB67l8YFzj3JKiAqP8nqqXl0rPwihQa4xKpdFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9LHyXNO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9LHyXNO"
Received: by smtp.kernel.org (Postfix)
	id 8570FC4CEEE; Fri,  2 May 2025 08:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ABBC4CEE9;
	Fri,  2 May 2025 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173924;
	bh=xYssf4LOgq0VNhC5INmCIVgWeSTMotc+cQY5inXoXj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9LHyXNOECKuTFUxrufswLzQgOSOKGErjXGQMIzBh86pMxxedZ79yhoMwPIbivJ3m
	 GEIFckpCwZ75yjXdsdah17LktffqNG/IN7E8CATQrkw1OimmAxw8iDdTIhJfWOyCvq
	 9+9FVC0z74DWL5IKkGPDEmm37eoJ60cYPsGJie+GsvptuNLjPgc65N2O7HVqTfg75+
	 OJd28eNSOYsZUFSP1mh4Ux6qwKLj9KNrblsSs+ya9YLL2oZ/qvP/VgqVbZaqYHUhup
	 G+POtO9RcH09XNJsqWpiLsC0nWN/+Iop+4/pii8fKFg7ptOHIMBCWYpcDh0s+aH0Nq
	 WUVN2nEVCZXeA==
Date: Fri, 2 May 2025 09:18:41 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH v2 1/1] ty: Allow users to specify whether thank-yous are
 sent to themselves
Message-ID: <20250502081841.GE3865826@google.com>
References: <20250501091502.3663038-1-lee@kernel.org>
 <20250501-cooperative-enthusiastic-squirrel-7dfc3c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501-cooperative-enthusiastic-squirrel-7dfc3c@lemur>

On Thu, 01 May 2025, Konstantin Ryabitsev wrote:

> On Thu, May 01, 2025 at 10:15:02AM +0100, Lee Jones wrote:
> > The motivation behind this change was that thanks-yous weren't showing
> > up in my inbox.  This is a problem because I use the presence of these
> > mails to indicate that particular sets or individual patches have been
> > applied or not.
> > 
> > Provide command line option '--send-to-self' to override the default
> > behaviour.  If this is not specified, there are no functional changes.
> 
> Can we call it --me-too, to match the --not-me-too option for b4 prep?

Thanks for your review.

Yes, of course.  I'll respin next week.

-- 
Lee Jones [李琼斯]
