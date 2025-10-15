Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F4123BCEE
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537799; cv=none; b=VqkkWwFRzXvwIq04G6p5hhrLT8AJ3QGpPXnz6XrTvkYxy7ZpI74ZV3PaVROuHPXFVU4Rjt3nSypXjxdMLMXLNCzLEBtBMIR4g00S2OkVd1KKunDyuHyVoiuuvX+eE5ZiNTZHCVON4jw5YMpqm1rODny6u51QxyPlEGVYeIBuh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537799; c=relaxed/simple;
	bh=zIhDIURXSTc9RkfNGTzExyhGZs8NPp8hjfhPe0kr3jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0YfQEZ1wMWJVbRDKMk6jkKhw/9E0EWY3q8rPDg8iYnpLt+y/00EwcxXvqKCrTrYGPmTNFLi1M9OKN7Ni5bp7vrVn1EsdR/K82HZkNVHzeeqbKVXS55ScoO6ftDNdnjUqo+2CaFbsA15495nt3d4dUVK+l6fMaXppd9B85Ru2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lZat6J37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lZat6J37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3D4C4CEF8;
	Wed, 15 Oct 2025 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760537798;
	bh=zIhDIURXSTc9RkfNGTzExyhGZs8NPp8hjfhPe0kr3jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZat6J37l4mOekOLauebYTffEJ+o5X2PKETcAUdnO+TsLn87WaoMtDWG5E9vJRb7z
	 BdT1CWdlkPpZEfgyRrZl4dfe6Z1VLYKbXDXoR6FbcgDZzAe+UcGzB0t00lHGKj9LJD
	 8eUkLgBrnP3Kl7HO+9DMViBUBUgKVfRGSnHRVS/g=
Date: Wed, 15 Oct 2025 10:16:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251015-zealous-debonair-bonobo-575799@lemur>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>

On Wed, Oct 15, 2025 at 09:51:20AM -0400, Martin K. Petersen wrote:
> With the edits I regularly do to fix typos, add line breaks, or
> otherwise fix formatting, the effective patch-id hit rate is much lower.

Do you normally edit them before applying, or after, when they are already
applied to a tree?

> Exactly. So far, 'b4 dig' has not been able to identify very many
> patches that weren't found via patch-id because of mismatched subject
> lines.

Linus would argue that in this case a Link: is warranted. :)

-K
