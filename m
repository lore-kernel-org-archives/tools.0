Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160021E22E9
	for <tools@linux.kernel.org>; Tue, 20 May 2025 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775034; cv=none; b=lT/vlnkSyDN+5hfk+U+xbYppTOVVvLnVwajMyZIqntXknAB8k/+WyYimVTcRiqjBWVmk/ohaDdIGv3QyZoJMhZXFSspzW9jqPyV7rV//UBzTYmYMf03lWyrQhD82ta68ML5yEAv7C8VpcZVxmVXWhtfMGjdLRT/C8nT+jeyV3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775034; c=relaxed/simple;
	bh=pgu6LcTe0l6NykqAQc0O2zwG8DDAdMa1VFpMcpH4uiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdS9O4ZNYuvqmu2Fu5V8/nEdS/P4vYtkapQycY0famRGmJ6ITtrDkZJemBNh06YxegoITXlHuUAZ2H3yUttJExGDHi/kO1Fn489gMoNXgAENxnk8ZoIDOuE76ejYgp0MJuy2p8tCpNslpzM+qmnxkX+V+dBFUflEj9dDgQLxGtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WJxOLu3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WJxOLu3d"
Received: by smtp.kernel.org (Postfix)
	id 8DBD2C4CEEF; Tue, 20 May 2025 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44179C4CEE9;
	Tue, 20 May 2025 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747775033;
	bh=pgu6LcTe0l6NykqAQc0O2zwG8DDAdMa1VFpMcpH4uiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJxOLu3dvG3YHQHzLEBN6s06tGqPQu7SxXaOAEWoYbbx3Imv/pOmvJnMHCKREmEkt
	 e6aih1LyCXOZeP8Z6v2O60b3l6aBnlUhkZ/lYXAHdt6whcKV87OSSg1vff3L0QfnqA
	 NbZ60REWp7Kb260749kXoGS0018zWo5df+V3P3G4=
Date: Tue, 20 May 2025 17:03:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <20250520-resourceful-salamander-of-opposition-131c63@lemur>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>

On Mon, May 19, 2025 at 12:14:30PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> This is v4 of the series that I called "Updates to wotmate, partly due
> to changed behaviour in gpg" before. Now it does some more things, so I
> renamed. The previous submission is available at
> https://lore.kernel.org/tools/cover.1747038870.git.u.kleine-koenig@baylibre.com/

Thank you for working on this! I've applied and run it in my test environment
as you suggested (against an empty file). However, I see that it creates a
bunch of zero-length graphs/*.txt files due to a lot of paths no longer
working when we exclude sha1. That's something to improve, but can be done as
a revision on top of this series.

For now, I've disabled the sha1 exclusion and rerun this on the keyring.
Looks good to me, so the changes are in now.

I'll work with the top keyring introducers to strengthen some of the core
paths before we try disabling sha1 again -- hopefully with less drastic
results.

Best wishes,
-K
