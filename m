Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3579A7E;
	Wed, 19 Oct 2022 08:01:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0AB133200953;
	Wed, 19 Oct 2022 04:01:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 19 Oct 2022 04:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666166502; x=1666252902; bh=DQ1FIj/MIQ
	usSugjdHoPqeI0a4kYzBh89mkHxqzCWNQ=; b=fFZBpjkf2XDpquvnCxNbGh7bzQ
	H4EnSQXP5MOeJF4Q1oiRmzUsChkSzosmTeoQl/8oBlAxFO/+0cJy+vpWGpSjfFtz
	ES82rgUPdz/Jw4KZqK/CmPBhTofdD481PpinvsSY1zEdJroCqdsaxZVes2NAhmL+
	AeJtXV4+q2+Yf2RGUL9DIdYnYK99StKEWNmg7+dku9LlVYe3+/2JGvXesBf2Adyk
	DcIcy4fga44BbhGG5m7IQIlsO+gNknBTjQ57pIio6x5yfAeBPBw6nqcjX1mxQi/y
	F5CxkjKLRKTz1Fan+/mWeHUe8QbZqI9Wtypcp+fNf0xmDNB0hqFQefg5dDNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666166502; x=1666252902; bh=DQ1FIj/MIQusSugjdHoPqeI0a4kY
	zBh89mkHxqzCWNQ=; b=H0CRI1si0qqpLUuO8G3kIA7EIjUouDngxF7eONdtNNe/
	HT6HTkOywnAGWpQAFtVG9mMNNhBpzslwQ+MwvN3x3WaIPrJ9RaVGM0sG/Sv0qEN7
	zpwRxtdKopQTxfSkYkzvD1EbcoDknwaANrW2/0JprIHNEEPUGKRdi9DjpqJum3R0
	oJiJuxks3cE79+Zz/atBcT0FNCXcxuVZdak/HiLc2trnf0kG7S7weCeiGUCAMadN
	vU54DQO2mi0uYNue5Tly42ReXrZjZZUBL2sqMc1VjYuHwWaHmDHLqTfps+Z4FQJ8
	JFaVDAtFP83Ys0LibImT1WttZJme0+0P0RzkfwhntQ==
X-ME-Sender: <xms:5q5PYzTWCmmm-It0sj5D72uLH-pQz6zP_DMPc91eXms0daN3X1BbVw>
    <xme:5q5PY0wI9k1NZ77OfdNnUu52wKryc4OwGnHs9K1lvjHCC3-fUhm3GJfF40_fQg8qt
    53xNYROEs68fVzxBGI>
X-ME-Received: <xmr:5q5PY40opsL8BVbk9e7v52GJg0rbyQDULxMMYThm2PQUQArszogJ4q_l1xD_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepiefggeefkeeuvddtieegtdfhtdehuddvuefggfefhfefffdufeeludel
    hfdvjeetnecuffhomhgrihhnpehusghunhhtuhdrtghomhdpkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5q5PYzBeDRactPGFrnzIEjnYmB8-3KhepnCzWCPJ2aJU9gjy_RVbdQ>
    <xmx:5q5PY8j-0xY_8owFF4PLmlhC0l5qJRQUw86lUUDn7iURptcSzXURfQ>
    <xmx:5q5PY3rHcQCNfB9G7iaT3bt7yNz2AX5VzvK9Mw3Mr3YZDK9A3bL5WA>
    <xmx:5q5PY0fCmtGnLlQrCN5g7ARZ33t_KwfiGl3ZAzibNtdCu0ehQjtJgQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 04:01:41 -0400 (EDT)
Date: Wed, 19 Oct 2022 10:01:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221019080140.zc42aqi7gwjpvczs@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bww7vs6geolx6dcj"
Content-Disposition: inline
In-Reply-To: <20221018201804.na5x7lohm4yszg5h@nitro.local>


--bww7vs6geolx6dcj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:18:04PM -0400, Konstantin Ryabitsev wrote:
> > There's a bunch of things I have noticed in the recent weeks:
> >=20
> >  - It looks like 87e0e464959c breaks msmtp which doesn't recognize the
> >    -f option, and will just error out
>=20
> There's got to be something else going on, since -f is required for sendm=
ail
> compatibility. The msmtp manpage specifically mentions that is supports i=
t:
> https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html
>=20
> (see under "options specific to sendmail mode")

It might be the auto argument that confuses it then? I'll check.

> >  - Generally speaking, rebasing a b4 series is a bit troublesome:
> >=20
> >    - It's a bit tedious to do. One needs to rebase and then edit the
> >      cover letter by hand without b4 being involved. I don't think doing
> >      the rebase interface all over again is reasonable, but maybe we
> >      could add a subcommand to set a new base?
>=20
> Interesting. I'm not sure I fully understand the problem, but then all my
> rebase tests were all very simple cases of running "git rebase <newtag>"
>=20
> Is there a reason why you have to manually edit the cover letter after a
> rebase?

I was under the impression that we needed to update the base-branch
field? b4 prep -e sets it, so I was assuming it was important, but I
might just be wrong and it's not needed.

> >    - If one sends a version, rebases, and then runs b4 trailers -u, then
> >      no tag is found for that series. I assume it's because the
> >      change-id has changed, but maybe for series that differ from the
> >      last sent version we could also look for the last sent change-id?
>=20
> This is really strange, there's got to be something else going on. Here's=
 a
> simple test I just did:
>=20
> First, I create a new b4 prep branch from a random patch series, and base=
 it
> off of tag v6.0:
>=20
>     $ b4 prep -n test-rebase -F 20221018111232.4021-1-elic@nvidia.com -f =
v6.0
>     Checking attestation on all messages, may take a moment...
>     ---
>       =E2=9C=93 [PATCH 1/4] vdpa/mlx5: Fix rule forwarding VLAN to TIR
>       =E2=9C=93 [PATCH 2/4] vdpa/mlx5: Move some definitions to a new hea=
der file
>       =E2=9C=93 [PATCH 3/4] vdpa/mlx5: Add debugfs subtree
>       =E2=9C=93 [PATCH 4/4] vdpa/mlx5: Add RX counters to debugfs
>       ---
>       =E2=9C=93 Signed: DKIM/nvidia.com
>     ---
>     Created new branch b4/test-rebase
>     Applying 4 patches
>     ---
>     Applying: vdpa/mlx5: Fix rule forwarding VLAN to TIR
>     Applying: vdpa/mlx5: Move some definitions to a new header file
>     Applying: vdpa/mlx5: Add debugfs subtree
>     Applying: vdpa/mlx5: Add RX counters to debugfs
>     ---
>     NOTE: any follow-up trailers were ignored; apply them with b4 trailer=
s -u
>=20
> Next, I rebase it on v6.1-rc1:
>=20
>     $ git rebase v6.1-rc1
>     Successfully rebased and updated refs/heads/b4/test-rebase.
>=20
> Now I update the trailers:
>=20
>     $ b4 trailers -u
>     Calculating patch-ids from 4 commits
>     Checking change-id "20221018-test-rebase-108ba0501f16"
>     Grabbing search results from lore.kernel.org
>     Nothing matching that query.
>     Retrieving thread matching 20221018111232.4021-1-elic@nvidia.com
>     Grabbing thread from lore.kernel.org/all/20221018111232.4021-1-elic%4=
0nvidia.com/t.mbox.gz
>     ---
>       vdpa/mlx5: Fix rule forwarding VLAN to TIR
>         + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (=E2=9C=93 DKIM=
/oracle.com)
>       vdpa/mlx5: Move some definitions to a new header file
>         + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (=E2=9C=93 DKIM=
/oracle.com)
>       vdpa/mlx5: Add debugfs subtree
>         + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (=E2=9C=93 DKIM=
/oracle.com)
>     ---
>     Invoking git-filter-repo to update trailers.
>     New history written in 1.26 seconds...
>     Completely finished after 1.57 seconds.
>     Trailers updated.
>=20
> I think I need to better understand your workflow to grasp where the
> disconnect is.

I just played around some more, and it looks that when the commit is
exactly the same, it's indeed able to find the trailers.

However, if there's a conflict (which is still fairly common when one
rebases) and we do a merge conflict resolution it's not able to anymore.
Rob's hint in his mail that there's a patch hash to retrieve the trailer
would explain it, the patch content (and context) has potentially
changed after a rebase.

> > And finally, and this is more of a feature request, now that it looks
> > like we have the list of all the older versions in the cover letter and
> > their base, could we have a subcommand to start a range-diff between an
> > older version and its base, and the current base and HEAD?
>=20
> It's already in master. :)
>=20
>     b4 prep --compare-to vN

Oh, I missed it, it's awesome thanks :)

Maxime

--bww7vs6geolx6dcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0+u5AAKCRDj7w1vZxhR
xVCZAQDc+mtCah4EQqT6PYzQPrerv0FXX5JSulmkvO8kWdXGQQEA9jkSVxOh9Ql1
FbRiHtk1ig7NUTj63L6/gZJvYL24zwo=
=6U9o
-----END PGP SIGNATURE-----

--bww7vs6geolx6dcj--
