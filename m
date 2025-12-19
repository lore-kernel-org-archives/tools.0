Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71064A33
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 00:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766104708; cv=none; b=o5gLIQmaW/GDgSKT4SryB+6pG4aF/JHwT6M78GC28ufqrkFzVsxcP+JfvYVOc5xsHEo2ZwS9lbKUsB4J9HMBWqympAMpBJy8GOVqT0aub8YGxKGR0W0HPjZyuR2Hv/Od/v5NFKIUU4yJZW8IubegdACrZFxUIUwa2ftenB93fhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766104708; c=relaxed/simple;
	bh=CXW3JA68HHZ1HnGbKUGo2XQaE1tPWor2cMhftmS+E0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0209ZI+MHHompxaFFv8NYpAjA3zVDRWpYCgUVaseTIcIZHKJkUsxbBs35vnswbbqZ3nMoIdu2FvR3K75lkPRfIfMUywxI+qD+OPaEII9uLyddilyxhY+rkuqR8xT2cNzFqpOITLa9yC7h0u0QWbm181Wa+He4F6AMcW752BNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qtdGoeV3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qtdGoeV3"
Received: by smtp.kernel.org (Postfix)
	id 7DD8EC116C6; Fri, 19 Dec 2025 00:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E992C4CEFB;
	Fri, 19 Dec 2025 00:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766104708;
	bh=CXW3JA68HHZ1HnGbKUGo2XQaE1tPWor2cMhftmS+E0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtdGoeV3dB0V5JYY3hbuLyjj0NOce3QOrlCQXjmHVeUerZEL+izSIyOsZks45ZYWx
	 un8qdHPVg0bAivWY9x47qjenD9hyNmYa3GKEvg8TGaD4MI71k6VoHBExJpyMTEj6Ew
	 nf37PaskJ2TQZUkj2CuBh6P62HgrrUVpN1Ynncj0=
Date: Thu, 18 Dec 2025 19:38:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, 
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251218-merry-azure-chicken-4d3724@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>

On Thu, Dec 18, 2025 at 11:41:17PM +0100, Linus Walleij wrote:
> > Oh no, this is what happens when I don't check adding new feeds after a major
> > refactor. I think it's working correctly now in 0.2.2 -- please check!
> 
> Is that also in the git? I just git pull --ff-only from the korgalore git and it
> still says:
> Successfully installed korgalore-0.2

It would help if I push, eh? It's done now.

Try the master branch -- there's also a "kgl track" there that lets one
yank arbitrary threads *and* receive any updates (requires lei).

-K
