Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66635580B
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090877; cv=none; b=B3WiF9LiB++SKq0qsERJvX1a5YDUx9aDAiaVqUJhNYncKZ5UhTWliezUwlgHqgPcvSQCF7+GLS3HI+3l4tDcLTwwurEmFEVAsl2FCKsj9ypUAvSSVh/V/kpIrwkQtWxBdTIa2zmRdiCvobfqhn95kBoD0GMo8vzbqvvdiiuTZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090877; c=relaxed/simple;
	bh=7PXZNxZzEpLveJvpdb1dUZ1WlI17puTogYIwrAXORn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2m/rpeMIznDJ7XPkWPB2kdTUHfYwfQQqDIB4UviZPCnghZG6im6GWRO0K58PYAWyYLq+96Ko5xNGJ9WDbdglKc2knF6SONUcSLsg1jc1oYHj5ZXXxiZseUf58d2vD0W12ozZIr/+4Y1IV/sEfhax5QO5DF4LdRm0XXOS4tWaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TeqmoNNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TeqmoNNA"
Received: by smtp.kernel.org (Postfix)
	id AEC95C19422; Thu, 18 Dec 2025 20:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C590C4CEFB;
	Thu, 18 Dec 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766090876;
	bh=7PXZNxZzEpLveJvpdb1dUZ1WlI17puTogYIwrAXORn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeqmoNNAGU7LytFskQuorfnmPh2SkzuAc/a6dVWpYrrVhKuuaMJUlFOlZXfpLVQUO
	 QWB5ttu8YlGcm+Sot8RtE0dQVT7drzeDkgkMdFUpP3J0KJySI2PB6Mtv/EViMVxU9+
	 3owawbu9Uqqj8+enYnJVSl8JtGNVmZ0AhUQ2K978=
Date: Thu, 18 Dec 2025 15:47:53 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>

On Thu, Dec 18, 2025 at 06:51:34PM +0000, Sudeep Holla wrote:
> > >   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
> > > line 386, in feed_lock
> > >     lockfh = open(lock_file_path, 'w')
> > > FileNotFoundError: [Errno 2] No such file or directory:
> > > '/home/linus/.local/share/korgalore/lkml/korgalore.lock'
> >
> > Ouch. Yeah, this should fix it for you while I push out a better fix:
> >
> >     mkdir -p /home/linus/.local/share/korgalore/lkml
> 
> I am facing a similar issue where kgl yank works but kgl pull fails
> slightly in a different way.
> I started it with kgl, version 0.2.1

Oh no, this is what happens when I don't check adding new feeds after a major
refactor. I think it's working correctly now in 0.2.2 -- please check!

Sorry about that,
-K
