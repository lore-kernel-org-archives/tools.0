Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D547A;
	Thu, 28 Jul 2022 16:11:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 736DC5C00D0;
	Thu, 28 Jul 2022 12:11:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 28 Jul 2022 12:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1659024684; x=1659111084; bh=IqD16N0vXQ
	MpenzmzDHZPNk/aCAsv1aQp146lc4szNI=; b=kDv1VBUhn5TMH/ocnSJaA2hkqG
	6F2RoyvGUGvCqPD+1Io/iizsp1lBXtlgyrxv50emznrfB+CVhDCF1HjgNTJzYcpP
	c1Z9j2GJNP84UzKt+9Ny6ef07WQ5TNaAXZd5+6fCgm5JaB5qiqkS77LRVyL7Gx2Y
	0Mi0CqwTN8G7PEazle+NJbxdYEkcuR13K4EuDLCPXiZWAaGSVNiS4l8cdq69p2Ae
	mbbpcSq8SeZO96etcz58guKRnjeFFvmlVZuTM23fcdl0hh8zL4GYHH6O+A+ZA9hi
	l6tsGUCJ4niWUXxllVfkSYH28m1jjz0Y/8Z/XYBMa6EWJh1Nnx5E84C5sxEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659024684; x=1659111084; bh=IqD16N0vXQMpenzmzDHZPNk/aCAs
	v1aQp146lc4szNI=; b=cCtpEZ+EDmsLBkecAFIyT75oukxR6JKUzI7PgtGV4p3Y
	3gz22Z9SW7ggRLDbGfh6YgqN9wXb64DWJYA+iIoa8vn0gSiiXlrR5v/c+nag/9mZ
	DINSRVU/LskCQN1/ZSMu2v/gQYErgncpAvZ1C4N56/au2DPqVlFHfOGiLqT+HdiE
	BasuOyaa6jN30Wp/j+aQPe5tZiLe7NQxMOeV4EkfgFNH7EZi37jjFAOA+HrsfAGW
	KoeCg2BrpGw9aPKKzL4BaW/hyTIrS5EWrBt+/fSe+EQIcmp5YW1t+BqKQos6Gu2m
	lMDRL30k2Ktvj9VoZlxg/1T4i3Or7UwPALJxqz2wjw==
X-ME-Sender: <xms:LLXiYunbOTB78HwwZlwnMSUxJKGIM06uZ1Z0mcM9PO7nn-x66MNJJQ>
    <xme:LLXiYl0U-JSXVGQxWHdk_s39KR80r0Xcgy9qgHSRvXs_IctQP3pKrGXGlz5yZxd7K
    DuPMdtrFa7JsqppMBo>
X-ME-Received: <xmr:LLXiYsqRCLPkPRMRRzdWs6_mLsdssI1ejY79FbQE5pLPFHkcFSyU1RvS8OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LLXiYin7vMSdHd2pwwzhm7Rf8QngPg9frYBHTE8GuQB6BSioH02vng>
    <xmx:LLXiYs2KLeLD56CcnLIBJ4svSv9QuEa46UADttk3VXHp9FwQi-omQQ>
    <xmx:LLXiYpvj-nNHtKw9-yILHDt3zyjqkqjS-3zznZKUh2xN6qVti8YalA>
    <xmx:LLXiYp_inpsB-CiXMsgznCZB5x0V-p0gJt8VKp3ID_4tJ1O5MWZcKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 12:11:18 -0400 (EDT)
Date: Thu, 28 Jul 2022 18:04:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220728160418.sgfns5jsisjsz5hr@penduick>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y5xi66ylfxe65eyw"
Content-Disposition: inline
In-Reply-To: <20220720184835.uhnkucai54alhgo6@nitro.local>


--y5xi66ylfxe65eyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 20, 2022 at 02:48:35PM -0400, Konstantin Ryabitsev wrote:
> Hello, all:
>=20
> Based on your feedback, I've refactored the submit functionality and it's
> ready for some more poking and testing. Here are the implemented changes:
>=20
> 1. Pluggable cover letter strategies
>    The goal is to support 3 different cover-letter strategies:
>=20
>    "commit": same as first implementation with the cover letter stored in=
 an
>    empty commit at the beginning of the series.
>=20
>    "branch-description": stores the cover letter in the branch description
>    (which really just means the git config file). The cover letter can be
>    edited using the same b4 --cover-letter command, or just with "git bra=
nch
>    --edit-description".
>=20
>    "tag" (not yet implemented): will store the cover letter in tags a-la
>    git-publish.
>=20
>    The default cover strategy remains "commit", but you can switch using
>    b4.ez-cover-strategy, e.g. in your ~/.gitconfig:
>=20
>        [b4]
>          ez-cover-strategy =3D branch-description
>=20
>   Note, that switching from one to the other for existing tracked series =
is
>   not supported (and I'm not sure will be). It's also not currently possi=
ble
>   to enroll an existing branch into ez-series with the "commit" strategy
>   (because I haven't yet figured out how to insert a random commit into
>   history with git-filter-repo, but I'm sure it's possible).
>=20
> 2. "b4 submit" command got split into 3 different commands:
>=20
>   - "b4 ez-series" to create/enroll branches and manage cover letters
>=20
>   - "b4 ez-trailers" for retrieving trailer updates and updating your loc=
al
>     branch. Note, that with -F this can run on any branch, not necessaril=
y the
>     branch managed by ez-series. E.g.:
>=20
>         git checkout arbitrary-branch
>         b4 ez-trailers -us -F [arbitrary-msgid]
>=20
>   - "b4 ez-send" for sending the series to the mailing list. It has all t=
he
>     same flags as formerly for "b4 submit", e.g.:
>=20
>         b4 ez-send --no-auto-to-cc --dry-run
>=20
>     There is no more --reroll command, as using ez-send will automatically
>     increment the tracked revision number (unless RESEND was in the prefi=
xes).
>=20
>     There's still no support on the web submission endpoint, but it's com=
ing
>     in the near future.
>=20
> Thank you for everyone's feedback, and please continue testing it out. If=
 you
> want to test the dev version of b4, use the same instructions:

I've started to test the current master (9e95d523c9b9), and there's a
typo in b4/ez.py:

sed -i 's/crtitical/critical/' b4/ez.py

I also have a branch based on an linux-next tag that I'd want to enroll,
but it looks like we can't enroll branches based on arbitrary commits?

Neither the commit ID or the tag seems to work:

$ b4 prep -e 37b355fdaf31
CRITICAL: Could not find common ancestor with 37b355fdaf31

$ b4 prep -e next-20220714
CRITICAL: Could not find common ancestor with next-20220714

Maxime

--y5xi66ylfxe65eyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYuKzggAKCRCIQ8rmN6G3
yywJAP9kksTxoblW+BBhWWl48k/Imtm2TTaQT3eCs+T7ymW3DQD/R4Q9jhlMOeDd
r8VRWCi25YOPl+acBsLNEy4DEvLSrEg=
=S5nt
-----END PGP SIGNATURE-----

--y5xi66ylfxe65eyw--
