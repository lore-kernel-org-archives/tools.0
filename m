Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45CF230D1E
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631874; cv=none; b=rFcY1RW9n4Phx6whiS6D+S1IF6jc4xNm21PjzkpaDqTW2lpK/jfQeyU7MhRVtYa29ucsgHbY9xXlE932ruj21iYlD1iQXe485b9iIBIYBbdjRXlmysEgPOgqfbNyJwa3rzWEyxHuuKdmafJX+3Q7j3qC/BvpOiV30FAzOdaIzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631874; c=relaxed/simple;
	bh=OSU0Ws5ia37rufZhWf2OOvCKZdnMqcw56dUqdm1hMQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjoZ0IC2+lEmYCFRFLGSWk225WiyseDgfBpJXKF3baBoVRJJFIrmadlmdIlARQ7XY/76DhgmK5iRbvySejRlUspQ48/QqlWAw7mhooBw5k33a0FxaZ1Gr4clo9CeSIk+0O49CMrKVM6bX0IZ/klnSernAn91fllwaha/w07+lOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PvOxszka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PvOxszka"
Received: by smtp.kernel.org (Postfix)
	id 68D94C19424; Mon,  5 Jan 2026 16:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E8DC116D0;
	Mon,  5 Jan 2026 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767631874;
	bh=OSU0Ws5ia37rufZhWf2OOvCKZdnMqcw56dUqdm1hMQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvOxszkaffTIxgj/z6kBv9xQPLs1g8eivHC4zz+GlL/3jHOcS721ip4vuTYFEXccV
	 V9ln13mKLUGTjT0bQx+oW16JaCHos3R5aVjZsa8zexdvpuiHWud0ALwsmYjRKU1mv6
	 gw3yJd4IhBW9cwnArmqvioe415UF+Kx4uQUCEgcI=
Date: Mon, 5 Jan 2026 11:51:09 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: tools@kernel.org
Subject: Re: patatt - tests source request
Message-ID: <20260105-ruby-aardwolf-of-glamour-342acc@lemur>
References: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>
 <20260105-curious-russet-goshawk-d97fd8@lemur>
 <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>

On Mon, Jan 05, 2026 at 11:40:12AM -0500, Mike Pagano wrote:
> When I untar the 0.7.0 tarball (for instance), it does not have everything
> in the git repo in the tests directory.
> 
> 0.7.0 has only test_validation.py in the tests directory.
> If you look in the repo, there is much more in the tests directory.

I'm not sure we're looking at the same tarballs:

    $ tar -tf patatt-0.7.0.tar.gz | grep '/tests/'
    patatt-0.7.0/tests/
    patatt-0.7.0/tests/__init__.py
    patatt-0.7.0/tests/conftest.py
    patatt-0.7.0/tests/test_validation.py
    patatt-0.7.0/tests/unit/
    patatt-0.7.0/tests/unit/__init__.py
    patatt-0.7.0/tests/unit/test_byhash.py
    patatt-0.7.0/tests/unit/test_devsig_header.py
    patatt-0.7.0/tests/unit/test_patatt_message.py

Did you download yours from here?
https://www.kernel.org/pub/software/devel/patatt/

-K
