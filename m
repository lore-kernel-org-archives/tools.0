Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8103011D
	for <tools@linux.kernel.org>; Fri, 15 Dec 2023 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EbLm4onR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4FEC433C8;
	Fri, 15 Dec 2023 19:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702667833;
	bh=wOq+mPEZVTr9higfhNmKvJ6rLRpmeSw1u82iKtwBD1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbLm4onRmZlK3IECMQOeyyfG8SlOEmyIrS9GbKgatpDXV6fkPTHsutHkn58YdRyIJ
	 uKSXMe/ulk6vUn+PaBVpPnomKmoMR82FBQVJxrYbz0+dUxt1RTnaIE6hWqvrjNpxvr
	 jDVBabY59YYev3PBg3eV0swHfsU3e2uPpCsAzAWU=
Date: Fri, 15 Dec 2023 14:17:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: tools@linux.kernel.org
Subject: Re: b4 send suggestion: handle .git_aliases
Message-ID: <20231215-rampant-private-numbat-08537f@lemur>
References: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
 <20231212-illustrious-lion-of-psychology-d85d9d@meerkat>
 <8c99d7e8-c389-a4f6-efcc-b36f884cb784@suse.cz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c99d7e8-c389-a4f6-efcc-b36f884cb784@suse.cz>

On Thu, Dec 14, 2023 at 01:33:22PM +0100, Vlastimil Babka wrote:
> >> and also if something malformed is given to it (such as an alias it doesn't
> >> handle now), warn instead of just dropping it silently.
> > 
> > That part at least I can handle properly.
> 
> Aha, and also just noticed that given multiple --cc parameters b4 only
> takes the last one and not add them up (--to probably the same).
> Although --help documents it as such, it seems an unnecessary gotcha for
> somebody used to git send-email.

Recording this for myself.

bugbot on
