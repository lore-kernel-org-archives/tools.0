Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106377;
	b=iw0ukPeblg4sBRvEfRIMiuTs4mEhTZgdqSLDOY1doW2yV7GUiYBrYuHiMtZmnuzUvpqx
	 ywsOmbk6/obHg/AuoKOyWFEnYPhL0TYTD/zCyHHtCtkLhxdNvEC5qpX6jHl9uFq2FwJPn
	 SaedAIal/GgKhIa0j7LswQHVOfr1eOjrkpWmTOC771PglN3PFWv9WzfwVn7mYC8jb+7WV
	 /I6EOGujla8LUrin91ZgEewEu9V2ci9y/xiBXGJzd48O6jTqimK9ioDCwFHanOojyML+V
	 BDtGF2a9RpTmXz81qV4onFBokByB9nwtEsp/b68zlWev0fBhpkrIw/Gqj28hbZpckOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106377;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=cVJ0rwu/ZwCC/CKiFECFsNEUd2WfY63V53GhBqdLKCU=;
	b=pYmkKotztN1TlFfgAAIQXl38WUTMjlK4XmqHqlRyfq2l9JjJpcvU54yB2FCENTJQNLVF
	 0FcbRFTvUYZjNpg9YDN75c/Og8HCB13EEhOAf+p3hs75HEG0+5WmpBmz5dOtZES1ZtANc
	 gbazM8h/GohE83KIiNuqR/A7CTGAVdBovlxAPUkiVTG0XdKPP+m1e/AVyqQ49OkOB74pf
	 MxxQbgb5maWlqApoOXdhRFa3pQYosGJUxq5+0CcMhdZhpl/8M4Nvnf2j3EtAsSVP9sIcq
	 GWJRifrKbDmDJnnnKLB6BFot1QhAAZn93ThMMHq3PPzIXrcG7Rlz09O2/gjE7v3IKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=C1QSjAv3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50E606A31B
	for <tools@linux.kernel.org>; Tue, 27 Oct 2026 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=C1QSjAv3
Received: by smtp.kernel.org (Postfix)
	id 6EC661F01828; Tue, 27 Oct 2026 13:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28561F01825;
	Tue, 27 Oct 2026 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793106376;
	bh=cVJ0rwu/ZwCC/CKiFECFsNEUd2WfY63V53GhBqdLKCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1QSjAv3UC08XXbaLTLQmvq/E1g7BgjvYkGdYwx2UA4IFFGpEkQkT1VtcJQENKshm
	 UKF6Ro9LjdBqdce3VfinGxAZD8v4FWZe1yTienxOZo4Nyw5ANH2TlbfPZRBDBuXFaG
	 6bcmoDjtQQDWgiyYZx+owWFDQlyrSBuMR9R2U4kY=
Date: Tue, 27 Oct 2026 09:06:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 0/5] review: fixes to track and forget
Message-ID: <20261027-enchanted-impala-of-luxury-ddd5c3@lemur>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
 <dd3b74a2-4f49-45fe-b708-139b7990b242@baylibre.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd3b74a2-4f49-45fe-b708-139b7990b242@baylibre.com>

On Tue, Oct 27, 2026 at 10:17:13AM +0100, Clément Le Goffic wrote:
> Hi Konstantin,
> 
> Gentle ping on this serie.

I had to focus on a bunch of IT things in the past few weeks -- I hope to get
back to b4 Very Soon Now (tm).

-K
