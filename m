Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A31448E0
	for <tools@linux.kernel.org>; Sat,  4 Oct 2025 18:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759602878; cv=none; b=QGc/Wvg0ePYVXdPKZa7/ts+suZGx5O70m7/Zzys7GB7QyIRJbS8IQTIK0yl3g3gp5SN1xTZWNr627IRK73tY+FPGJHrjKWsJitUFzJT8vNFX+FWtB5hif8rBcd6mAdiQwLm/fcQjUc9D1iNt08KSeahpySt1f9uPxpdQDcwdaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759602878; c=relaxed/simple;
	bh=vebaugyk7DwE9rhFvOsSfioanblbQ0i+CP24+kcpTF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSyIOvlAxlY7Tx3SNOvFG7pzFRQGcDNdO3Fnp0QwrI4/MgEheDIYTOAi9gIJdJ05UDfOHbu1yr/7Vn3fdJVahyGzvX2WZgFDk5mJX5evwKNpc/TczO44QN8XvLaB0V0+jp4B8IGdhOMmKZsh4Xbth7lgByBwjuvqPUtaL12cEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YD3iLtF1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YD3iLtF1"
Received: by smtp.kernel.org (Postfix)
	id 1C2B5C4CEFC; Sat,  4 Oct 2025 18:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC76CC4CEF7;
	Sat,  4 Oct 2025 18:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759602878;
	bh=vebaugyk7DwE9rhFvOsSfioanblbQ0i+CP24+kcpTF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YD3iLtF1g3Qdw0QftDJb/Ngk72JH/eMLhioLmCO3TUI6XI5HBWli0Snenhfphw7Q1
	 I+gdCYkDjQ9+WgECE/mTUArKy5+O6TfPI55hyyzFMXeeaxmOc6Jsby14qpRs2tkkf3
	 0jq1nS+1q+ziDs7vcSlEcYILCnXJFxftJlN69SbA=
Date: Sat, 4 Oct 2025 14:34:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: tools@kernel.org
Subject: Re: [b4] Release tarballs missing & test failures
Message-ID: <20251004-groovy-eminent-booby-3dfcad@lemur>
References: <32207548-725a-488f-8815-bc208311482f@heusel.eu>
 <20251004-dainty-armored-armadillo-e2a080@lemur>
 <f4a564c5-d306-40e5-9031-ff0ce1e33a3b@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f4a564c5-d306-40e5-9031-ff0ce1e33a3b@heusel.eu>

On Sat, Oct 04, 2025 at 08:15:57PM +0200, Christian Heusel wrote:
> > It was just an oversight. The tarballs should be there now.
> 
> Thanks! Did you have a chance to have a look at the test failure?
> 
> Just let me know if I should provice more input to debug that :)

The failure is due to a bug in git-filter-repo:
https://github.com/newren/git-filter-repo/issues/684

It's unlikely to break b4 unless someone uses a non-default b4 configuration
(which is what tests set up). I really wish git-filter-repo would release a
version with a fix for it.

-K
