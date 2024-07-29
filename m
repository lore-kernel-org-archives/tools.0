Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01856186E29
	for <tools@linux.kernel.org>; Mon, 29 Jul 2024 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287986; cv=none; b=OJVo0bA8F1MQsJ+WkgRbzsRjVeh/t84WAl8sgdoBAse88EWfuMiCV0TnAk1lN8FxFCC+rrKunKak6sMoYTNwf9r34NtIhJIyjeez5Kuy0UYIarEbnr33HKlTJAqb6woVVvoK2Kq8jXF7xSTRp7WC/am5fPK+6W2YP10r1f1z8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287986; c=relaxed/simple;
	bh=IiNDPhMWNVNF+7hNf3kVTDurOtrX7jrqCDbpB9PaAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/PRW4BtISKMu9uk5ps4Qe1MYw1FjhRF6nsJgQETBXxrhAd10XP20Fe1sA+avKD344qX51k/IRMG7yQdIwxB0SRmVTPdeA1aFWdjxfYvqVtgVPZgfZxSNvrhGEqda0uY/7CmK0s7IkSlg4oGyhQywt2xFyXQ7bLdgChVIcYhuRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gTmssHHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gTmssHHz"
Received: by smtp.kernel.org (Postfix)
	id 9066EC4AF09; Mon, 29 Jul 2024 21:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4823AC32786;
	Mon, 29 Jul 2024 21:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722287985;
	bh=IiNDPhMWNVNF+7hNf3kVTDurOtrX7jrqCDbpB9PaAJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTmssHHzq0A6qnt+A7gkyG1TA+6bVG3/A7RmnhnNgVQV3WEUxqbK+FFxldcIBBW0Q
	 YQMoo3tyuUDgv+qLZ4VTUpCeUlrst+qEW9DbCuGEhjVp1nxa9KaiAzmhFwe6hVPVbh
	 w87/BcEVJdmeuQSBIJgmw1RDIJ445ihLXP0ElvhI=
Date: Mon, 29 Jul 2024 17:19:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: tools@kernel.org
Subject: Re: Can't reauthorize with endpoint using new GPG key
Message-ID: <20240729-macaque-of-inspiring-recreation-9e5c4b@lemur>
References: <5827210.DvuYhMxLoT@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5827210.DvuYhMxLoT@radijator>

On Mon, Jul 29, 2024 at 11:07:41PM GMT, Duje Mihanović wrote:
> Hi,
> 
> After replacing my GPG key, I was unable to reflect a patch series with the 
> following error:
> 
> Error from endpoint: No matching key, please complete web auth first.
> 
> When I run `b4 send --web-auth-new`, I get the following error:
> 
> 500 response from the endpoint: {"result": "error", "message": 
> "i=duje.mihanovic@skole.hr;s=default is already authorized"}
> 
> After doing some short digging around b4 and korg documentation I couldn't 
> find a way to revoke the old authorization and be able to use my new GPG key. 
> Is there a way to do this?

Right, updating existing keys is currently not supported -- because I need to
figure out how to do it sanely and securely. 

Your best bet is to define your new key as a different selector.
Add the following to your ~/.gitconfig:

    [patatt]
    signingkey = openpgp:YOURNEWKEYID
    selector = 20240729

For example, for me:

    [patatt]
    signingkey = openpgp:E63EDCA9329DD07E
    selector = 20240729

This should let you register your new key with the web endpoint. You can make
selector anything else, including your keyid, it just needs to be defined so
it's not "default".

Sorry for the lack of documentation on this.

-K
