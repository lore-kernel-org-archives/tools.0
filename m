Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C85A7AB
	for <tools@linux.kernel.org>; Wed, 14 Feb 2024 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922623; cv=none; b=HmIFq0/xXHGNGxmFA2s6suTgoJ2Kz9shu8gtm/uT9A43fOxx9OFBs24zMVj1wamCC/rTHWQmqL4b2qt40bK5POoal31+Q4sel7NkcXwm25u4/Sly8zVkQuf3uAgQJXtvjMrnrpRKrzL1MNAbcxF88iedIS2LdWJQc0JwP2Q617k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922623; c=relaxed/simple;
	bh=qxDNps9G1TcZaU+XnZf2LXtwLa6CwlWPBDJgjULlQYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vr+OKxUT6oMvBItj1C4Xj0SnK+KeTkxOZJdZaNZk+YB8OMnF0OuSMk+r81uM+BGfCTikSJ9wq4W7uOAQoUhOfPBf4xuHwKgTOVs6+BxXJMYNoUSUwhm5GypRaoOUaE5rOVCCeBM+E4bBbjEhM3w8QnB1KavhSPcS7EfGgu5sJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zRKwHUr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zRKwHUr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA5C433C7;
	Wed, 14 Feb 2024 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707922622;
	bh=qxDNps9G1TcZaU+XnZf2LXtwLa6CwlWPBDJgjULlQYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zRKwHUr+FdMlzAevQjthOHHRRGf2ukIETGkBuBCyxUqTtl9zdnSVRfK7ECvYMX6ix
	 S7Ly1ZGVxIox0xErAev94PxBD8Ths4JY4Ak16dz3Xo4Y8rOCNkKVOYQOpoQAYsWuwQ
	 4+OrFPyVTPhWV/B4Dnq77bHWC4oyn7OVBp0qqiMM=
Date: Wed, 14 Feb 2024 09:56:57 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Cc: tools@linux.kernel.org
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
Message-ID: <20240214-boa-of-nonconcrete-flowers-2c94cb@lemur>
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur>
 <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur>
 <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
 <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
 <CAHC9VhSXHKWHSBiLQjD73emXSrLG8J7DCYLqEuBhVcgZezZOfg@mail.gmail.com>
 <20240214-tall-xanthic-chicken-1eb62f@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214-tall-xanthic-chicken-1eb62f@lemur>

On Wed, Feb 14, 2024 at 09:13:56AM -0500, Konstantin Ryabitsev wrote:
> > It looks like some time of check should be done in the patatt example
> > hook to ensure cover letters are handled correctly.
> 
> I think the real solution is to fix the bug that's generating invalid headers,
> not to work around it in patatt. If it's not a bug that's introduced by stgit,
> then we should take this up with git proper, which I might do anyway.

So, after digging a bit deeper, it seems that the real problem is that
'git-send-email --compose' generates a cover letter template that's not what
is actually going to be sent out. The trouble is that it's then passed to the
sendemail-validate hook without actually being a valid RFC2822 message.

I've added a change to patatt's hook that will specifically refuse to run when
it finds evidence of the cover letter template content. Even it it was a valid
message, we'd still be wrong to sign it, because it will obviously going to be
modified before it's actually sent out, so the signature would end up being
invalid anyway.

Paul, would you be willing to test out this change to the hook?
https://github.com/mricon/patatt/commit/60309eefca64e34a8c15615f45235471824f891d

-K
