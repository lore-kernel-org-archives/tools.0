Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69222147E6
	for <tools@linux.kernel.org>; Mon, 12 Jan 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250941; cv=none; b=YuXXp3AJ2zQNzCtWOYFQEWHJsAv6O+60lIuyFYS68ih97hB1EJY6gxSoCFh42te5MdJ8JxWmncFyEuZBZfOcFlo+eAA0xMgvtE1Xx/okl3ZSW2lMIzDx3njQkzYXewmz8yk4tdqUkv3Mhjc1BxwYVXVHN9dACpe9Ty3MFIBHyd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250941; c=relaxed/simple;
	bh=iUB5z3GkPH5LRSAJX2vpwEMn2XlMdIIfMmQjWGy54r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVV47DTfAGR6rIMM43h3torC4Gfk7jbI2dTNXi1XU4lvjWDRafPCPO9rungCvhaOzEkchP6TKdWcRW/pYNKBjEutEJAzhNVjdlT/ZQoJJLebbA092+VRTVoSWKq2JVDBLqmY4haTtxbwZgXbpiqP8r6hiV8yOZeslpq1mZnNnF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Otv2a2kW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Otv2a2kW"
Received: by smtp.kernel.org (Postfix)
	id 7F917C19422; Mon, 12 Jan 2026 20:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4CEC116D0;
	Mon, 12 Jan 2026 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768250941;
	bh=iUB5z3GkPH5LRSAJX2vpwEMn2XlMdIIfMmQjWGy54r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Otv2a2kWhr7/7NFYtimRwFVlXZgPKjV5JHHEEgDCuNNe9lcmdRIrv8Tt8JO+hD0ZN
	 umFqRnaVhzvc09IB/GWViaF+sE67oKbWcg+p1youifYrSBvHbjs//a/wmnptgyCoXy
	 FiMzYXavLUJztgGwdZ5aSZDhBKzKMp+UwPQVjw24=
Date: Mon, 12 Jan 2026 15:49:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, 
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20260112-cheerful-cerulean-pegasus-e7ccf0@lemur>
References: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur>
 <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>

On Mon, Jan 12, 2026 at 08:52:45PM +0100, Linus Walleij wrote:
> > I've not actually had to redo my gmail authentication again, but I do hear
> > that it's less smooth for others.
> 
> I've had to do it twice, second time today.
> 
> About that!
> 
> What happens when the token expires is this:
> 
> $ kgl pull
> (long splat like the one below)

I just pushed a fix for this -- please pull the latest master. It won't fix
the invalidation problem, but it will hopefully die nicer now.

-K
