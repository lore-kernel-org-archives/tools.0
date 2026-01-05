Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC733ADB8
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633651; cv=none; b=BDfXeb65sMVUgupRAF9Hb9pmjhGSyweOQJii+mvacISPttF+r6qoZKManArLukdnWFTjFZ1zMLZqlnVsOp/B/agxJdLjajeQA9gvG5bvvPRwHuLdNVZbaSyEBAmudb3Snd1s/bR61dk85W3UP2iIWpa9RfNkiKBw2Uf/fcNKquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633651; c=relaxed/simple;
	bh=8tnC8QFQVX8YZl2mGu9sn3ImVbh5xFqzgKA1N1DKMAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnnN948sWWhxhh0WQw63Crx4/8CVqdgiiDUGuaZHVargL2rtD+YvHf2nUi4rtQBi1Mn/OYPJuWj8ew7y3fPmCmURxLioGVc+CafdOn25f/CZLWusASpxVB713Pv/7mlHYHVazIjmpljbL30kpfwFMjhyZCX+4a7Kiue19uwV35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yN9EFjDU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yN9EFjDU"
Received: by smtp.kernel.org (Postfix)
	id E1BAFC19421; Mon,  5 Jan 2026 17:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBD5C116D0;
	Mon,  5 Jan 2026 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767633650;
	bh=8tnC8QFQVX8YZl2mGu9sn3ImVbh5xFqzgKA1N1DKMAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yN9EFjDU888iGOHjWPg9oWjSZPnbAyg8sM3olQ83JE/9aBp5h8dHdOp9n6BUeHXna
	 2R60n4ozmoWBZsQ+XopfWKmupP8ef50qAgd/MI5bNh/PvzQMsSQfhsYoBVX/v8JuSR
	 yLrcxH9P+IixCtvDqKq7adLAh4v8GKcAY3dR8RR0=
Date: Mon, 5 Jan 2026 12:20:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: tools@kernel.org
Subject: Re: patatt - tests source request
Message-ID: <20260105-sticky-goshawk-of-happiness-d1d9c8@lemur>
References: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>
 <20260105-curious-russet-goshawk-d97fd8@lemur>
 <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>
 <20260105-ruby-aardwolf-of-glamour-342acc@lemur>
 <b81c15a5-0030-4ba9-a7b2-cbbdb19d4222@gentoo.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b81c15a5-0030-4ba9-a7b2-cbbdb19d4222@gentoo.org>

On Mon, Jan 05, 2026 at 12:02:04PM -0500, Mike Pagano wrote:
> > Did you download yours from here?
> > https://www.kernel.org/pub/software/devel/patatt/
> > 
> No, we are downloading from:
> https://pypi.org/project/patatt/#files
> 
> I will update our URLs to download from this URL.

Hm... I'll check why pypi's files are different, but yes, please use the
official tarballs (that are signed, anyway).

-K
