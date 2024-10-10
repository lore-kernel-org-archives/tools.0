Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55E1CB305
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571111; cv=none; b=OTNjSn7Lw3XKTZ5S4GC94lLhSVSy2ymiAySsizLptKA6sIT5u6o6vGHoEbKLqziZoWSGXdLx2J6aNYqz678eeJo2ifa/n9J3sfrKKfrdm9yViWgHWPmZXRgDgNdhEKxooTUa4rJ6AcKyWiaE3aacRYCwYuO7tSp865Re1J819Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571111; c=relaxed/simple;
	bh=jjrQhNKw779XZd4aozEC2yRtVO3ibU4wUfYz5k1FVBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4YW6H0W5Qp2puZmnDMi0TrMRM2fmH2Yy1U2SQY+fSneBPWu9H4FPv67nUR+HtrUCCn9ZomSsphfmkDmKknqrM4RFRlAJ5bhZlue1pi8xo/vBqELcTgcDJqTrxbj0NCZ68VJCTTXTeCezw2U5PosichcVkdwVM4s3djBr/kvh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Os4cDfGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Os4cDfGr"
Received: by smtp.kernel.org (Postfix)
	id 76D0BC4CECC; Thu, 10 Oct 2024 14:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE00C4CEC5;
	Thu, 10 Oct 2024 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728571111;
	bh=jjrQhNKw779XZd4aozEC2yRtVO3ibU4wUfYz5k1FVBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Os4cDfGrBpzGZrne3dWaa6jqpz6BChEktkVOB/LTHGI/8GeX9EylOW6QidgmwUoQj
	 j0w8jjuXMrvBCNDKD+F1ubTIpFRF43+8jMrcaurJ0DaLi0zBdHpp2XxKmXH9mHwGxL
	 A6MfldXh0IA/XlOOiKnx8XacEXTfaCLyxhFiIk4E=
Date: Thu, 10 Oct 2024 10:38:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: tools@kernel.org
Subject: Re: b4 crashes due to type error when signing with gpg key
Message-ID: <20241010-ultra-unicorn-from-arcadia-291704@lemur>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
 <20241010-refined-important-mole-a56fc5@lemur>
 <52dc54e8-b7a3-4892-aec4-067d8e8c331d@heusel.eu>
 <20241010-qualified-airborne-muskox-2cdf05@lemur>
 <c57f3c63-9996-4a77-b361-c34675b1137f@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c57f3c63-9996-4a77-b361-c34675b1137f@heusel.eu>

On Thu, Oct 10, 2024 at 04:22:54PM GMT, Christian Heusel wrote:
> > Can you please rerun with just:
> > 
> >     gpg --with-colons --fingerprint "$(git config --get user.signingkey)"
> > 
> 
> $ gpg --with-colons --fingerprint "$(git config --get user.signingkey)"
> tru::1:1727197441:1804773157:3:1:5
> pub:r:4096:1:A3AA55C37A759E7C:1476016014:1633696014::-:::sca::::::23::0:

Yes, this helps, thank you. For the record, we don't currently expect the
command to return multiple keys, because we assume that signingKey would be
pointing at a keyid, not at a uid that can return multiple unrelated keys.
When we try to look up the fingerprint for the key that did the signing, we
come up with the wrong result because the first key returned by the
--fingerprint command is the revoked key.

I'll keep this bug open as a reminder to fix it in patatt.

Thanks for the report,
-K
