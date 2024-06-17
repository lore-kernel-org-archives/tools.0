Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CBE13AD2A
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636866; cv=none; b=Flr+tzEGsT6W8Pt98zetW6I2ntqupKsl/H1di0j9x7oZ84XQDzh/G9B9oY6iodpphELZzvfQgmGUNBsEBh8CTnglF33CM2381Cej9nu1BiqzY9SPacxoz2qQfyMa9GxcwzX9bahTwymx+OXUarYauojBw6izeVDRw4ySMYul+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636866; c=relaxed/simple;
	bh=OQto3ie6MAMPvqMwRy2slrUMGq5VqsCVu/PCavsHUI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7cZEIeB58UK5aM9nqPqfEyHwz6+IGoJhoeUOTt5BuTCXJrSY+/pfSgeO1Q0rrCQjbi6VJplyxfAimpR/W1KQQaYvu1ZF7QlywllJ6akq86i01YKLTbzP2bxK6aQrAB+vEQ+O9bqNTzLiozJsLYbDkp1RMZ7q8wrJhHiN3SSbkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObLenCbQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObLenCbQ"
Received: by smtp.kernel.org (Postfix)
	id 3EBB9C4AF1D; Mon, 17 Jun 2024 15:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27F6C2BD10;
	Mon, 17 Jun 2024 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718636866;
	bh=OQto3ie6MAMPvqMwRy2slrUMGq5VqsCVu/PCavsHUI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObLenCbQooMKAFzfFnCkUAT4wNg+qrLE0SHQKPjG8HR+qwrkVxCjP2oIxh5KfJo9x
	 duzit/ZFNG1qv0ouG8xLZZZEn0f4MfTAjShf2TkYdDf8RnogYtqEk9IptkvKP5o/jX
	 r/o1D1PR9QMNQdmia7/hlwEyMf6UCPnrbl1CV2zTfqEGjtSWgEhHAX2v6uxss5zQiu
	 7duSaxWgJo7fJVXMVLX+WynvWiwCLegNt9BPcqUZYdw9NaDW4XUUCAD/oMnl06m/Ct
	 38Ps4W/oRQ5KRwYJYyGa1psHRH+NdRE346eh06wGWPJKWAC2pSrLdPECnSGD6+Zv4u
	 UoxkcKTBM0pEg==
Date: Mon, 17 Jun 2024 11:07:44 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <20240617-calm-bald-dinosaur-ce8efe@lemur>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>

On Mon, Jun 17, 2024 at 04:33:27PM GMT, Alejandro Colomar wrote:
> Hi,
> 
> I tried uploading the tarball for man-pages-6.9.1 to <kernel.org>,
> following the release instructions as always, specified in
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/RELEASE>
> 
> However, I'm consistently getting a fatal error from kup-server(1).
> I originally reported that in
> <https://lore.kernel.org/linux-man/vqexqoi4imi6e4sm3ddz3vicqslxip24shu42ut37ydanfqnlu@2hpc5rue2d6e/T/#m4f61f1814c26c576f21da88262577511cf891976>
> 
> Here's the problem:
> 
> 
> 	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/

Try:

    kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-pages-6.9.1.tar.gz

-K
