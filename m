Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A753E0B
	for <tools@linux.kernel.org>; Wed, 17 Dec 2025 21:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007526; cv=none; b=MPdJJHJxCOCU8p8/ZUoXRbhkBZjnz8ZX2mFOMwdGalTE6iJLRUis9bzqo0fWgykNbs/SXwjbnEY9Ui0qZZjRwCbHkmIljLcvXO17dxrnnos2V1/NaGYUUus9jdbobC/z7c6HVIMQt/5BNa9UWvi7EaHSUJIZDT5hPHSy53V1rUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007526; c=relaxed/simple;
	bh=Mfq6rafEaYIPBMYQOpP23U0q1yDnfgZ4/Det7G7aNnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOjquMWxSUAHwbKwFUA9FMelrlJW+/ZSbOPi51Pz5jQgiozzOcNiic4iRNA/4d2WnVwW8yM8UHzuZXdAlm1JsHeqbZNgzj373Attad2hKtfXufvqyfosGj+JYZlWPN7Yn5BWx4lkvzqbTZh1XJK5tOu5r4yOZPspajvzrdq7LKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0dEPi9GA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0dEPi9GA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E1CC4CEF5;
	Wed, 17 Dec 2025 21:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766007525;
	bh=Mfq6rafEaYIPBMYQOpP23U0q1yDnfgZ4/Det7G7aNnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0dEPi9GAcL+hWmQrtbg9gATGe1OKBxT9aKm3D5N73/k6N8Oh4gEmh3jLuurVN3Qhz
	 Gji1LvbIsQJX24w5sL3EqJ1tvCnWOXj1hE+NsOh0QigtuJNNnmlNTkrBZyIOmYy2xf
	 /412e8sadwTKZnPznunRcOdKfW6npne+4OmptSJk=
Date: Wed, 17 Dec 2025 16:38:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "N. G." <mailforng@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: B4 - Badsig error
Message-ID: <20251217-amiable-steady-owl-fe2a0f@lemur>
References: <CANKRBiJmWWaNVonGhJ0+T6mpUSzAVxoq9ZoqwKNTQvDH0SwDJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANKRBiJmWWaNVonGhJ0+T6mpUSzAVxoq9ZoqwKNTQvDH0SwDJg@mail.gmail.com>

On Thu, Dec 11, 2025 at 10:06:17PM -0800, N. G. wrote:
> I am attempting to use B4 to install the patches at
> https://lore.kernel.org/all/20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c571@chromium.org/
> 
> I edited my git config to allow the tofu attestation model according
> to these instructions(https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation),
> but it didn't help.

Right, this is mainly for maintainers, not for installing one-off patches.

>   ✗ BADSIG: DKIM/chromium.org

This is just a DKIM verification, and in this particular case the only reason
it's failing is because the patch is from October. DKIM signatures often have
an expiration date -- in this case, x=1761743531:

$ date -d @1761743531
Wed 29 Oct 2025 09:12:11 AM EDT

So, the BADSIG can be ignored.

Hope that helps.

-K
