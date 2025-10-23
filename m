Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2681434B697
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248709; cv=none; b=WNymwfZOrnQFr6/ByXjAL64KXXHKYkDDdAKewqJ7tny00IXWHyzVB8ES/QXKrUyH1XAlM7yRvXD6mlGr43SxPpv+P6BcHNQLZTsoHJt1lj8dHWZLm7x93sAdFz1u8ZEFg2ISlNKav6GntHdzQdSXxM4VWA9mvYa7LE9k5YSnYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248709; c=relaxed/simple;
	bh=B+9dvBGHgqXQg1A8h2Yw9NgqwCSMpiK4J7Emt9UH25c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBbGdZhJtSGb/tFolYGRjXkppGhYrRPsfs4ZLajDLncb9ipARUO7qo5RTadXTcr7ddTv6BXx9TQQYQuu726ysighyR5Skc2XASysQ87kO2G2dqP0N4eqm+kCxiFmRoV0+RPi6ti3nbJJPk/jZfiOmJOnQtfOEuuHBdQimZDEeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LLP7TZR2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LLP7TZR2"
Received: by smtp.kernel.org (Postfix)
	id 9A192C4CEFD; Thu, 23 Oct 2025 19:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6123DC4CEE7;
	Thu, 23 Oct 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761248707;
	bh=B+9dvBGHgqXQg1A8h2Yw9NgqwCSMpiK4J7Emt9UH25c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLP7TZR27GTf3c5jcF+U+xESEkl1wjplQGHDzTvcYj52OhcHmvk2hdLmPrY7Vnl9y
	 8N8BKU30RNUaxa51bt/QFDDvwgwrj/nGPA+lgOeMSy/lBHpbCLpSH5Xz9u2WgFo1G2
	 ChFAAdv0IHTwb7hWtSK1e6OgmUgYVaFbj+YptyeM=
Date: Thu, 23 Oct 2025 15:45:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
Message-ID: <20251023-merciful-angelic-squid-0a97ff@lemur>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>

On Wed, Oct 22, 2025 at 03:24:56PM -0700, Jacob Keller wrote:
> The b4.email-exclude configuration option allows users to provide a list of
> globs that define email addresses to never send to. The configuration
> option is interpreted as a comma separated list of exclusions. If the
> number of excluded entries gets long, this can get somewhat annoying to
> manage in a configuration file.

For long entries like that, I was kinda envisioning it looking like this:

    [b4]
        email-exclude = \
            foo@example.com, \
            bar@example.com, \
            baz@example.com

I am not opposed to making this a multivals entry, because then it could
combine multiple entries from several levels of gitconfig, but I'm curious if
you've tried doing it that way.

-K
