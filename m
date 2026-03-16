Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002632D45C
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691183; cv=none; b=NLcn3IRUhouF1fclY3k6xNOZiGiTKzGYsBSxcT7BN7sRD3lRxggNyGijB8GPeai+dSAC0PZTZ3Ck+Vnc/zkD60RA9xE/ezfYC7Howrl9Z6J0EZmDNHhIKJFcOo0hswbYQrHCCZF2947tFw7H3zaa3bViq5SMvKvDl3CVhK1InB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691183; c=relaxed/simple;
	bh=otHbj998dYuFAjCoboGdvcNxIibFk8bQJgoI7829uqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVnvhHg+bQHZUuxGd+iBMWvKLnW6d/oQR+l3RClgXGBSyX8EQgXFFDwZeahj6+s4KM59ot+j+HRNr3TAPnbrHfKmaLclRkzyaYHO2lIR0PDyqaLAaixqAhuEDW3aRKAZ/9fe0LphvxrZ1dVz+zufO+JNhx5vHTQGR5YkVhtXgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjCRMFvh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjCRMFvh"
Received: by smtp.kernel.org (Postfix)
	id AE5C8C2BCAF; Mon, 16 Mar 2026 19:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943A5C2BC87
	for <tools@kernel.org>; Mon, 16 Mar 2026 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773691182;
	bh=otHbj998dYuFAjCoboGdvcNxIibFk8bQJgoI7829uqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZjCRMFvhhWN1OzMrUaSpTk2mDe0ZE5zoW+UMPw+4WNqeRqgAoRuBQF+yYnYi2fp0L
	 5wl91k6F+y3qBKmmRmJbMBl6esRHRjhR/qYaqot7AH2rMCm/AS69x+tB7ibm+s75ky
	 NIjwDUcR0SK71ekV377WBh/MGv3sBr1re0UjSrIBNaoJRybmmZDTWAD8+E27jT35xk
	 b7KAMJX4rb2C0tIfXJx2NlSKtB26F8c9MOZbGwJrjX7Lc49ToVrqL8zasGOwhTjoUL
	 LBVts29AR2DqtANP90w/r/JIg1UXaIdHv0rQ4Hg1qPWpWp2KtUlyW6O41UzZmhoXnC
	 zZ69Nr+tH3qng==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-386b553c70eso43292551fa.0
        for <tools@kernel.org>; Mon, 16 Mar 2026 12:59:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyrS7BLP5Gm8QJEjXo+FNvEOaMdHKz7SWsNrAsuACAKEwx2SGqq
	0s9/njtrPdmJyAiGi7hleSgkEnEzUUX+Is8GfwSGxeF+dht/DEYJAt5O5sQ5QC8iQ83fT/iFRKM
	xqclwsZN3j2j7tNVW4p9w5JKXYJc1rqw=
X-Received: by 2002:a05:651c:1b12:b0:38a:a2b:5ef6 with SMTP id
 38308e7fff4ca-38a897ab5b7mr53245801fa.24.1773691181261; Mon, 16 Mar 2026
 12:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260316-review-reply-followup-v2-1-f0482c4e8241@kernel.org> <20260316-fox-of-glorious-gallantry-e105c4@lemur>
In-Reply-To: <20260316-fox-of-glorious-gallantry-e105c4@lemur>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 15:59:05 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mt2pSVNWgvdBbnFoYGUjLDxxzy=vE8jvx9MFEZMQAt+A@mail.gmail.com>
X-Gm-Features: AaiRm53X6cpCNqLdcXmrsmIOFPYO72yXDj8d05-oJOWL-P_uyWsd4vD5blyWViY
Message-ID: <CAJ-ks9mt2pSVNWgvdBbnFoYGUjLDxxzy=vE8jvx9MFEZMQAt+A@mail.gmail.com>
Subject: Re: [PATCH b4 v2] review: implement reply to selected follow-up
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 3:56=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 03:55:14PM -0400, Tamir Duberstein wrote:
> > Reply to the selected follow-up instead of collapsing all follow-ups
> > from the same author into one sidebar target.
>
> I think I merged this in already, just sneakily. Can you check that the l=
atest
> master does what you expect?
>
> -K

Yes indeed, looks good! Thanks, and thanks for making this awesome tool :)
