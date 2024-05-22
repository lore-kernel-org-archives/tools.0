Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33393BBC9
	for <tools@linux.kernel.org>; Wed, 22 May 2024 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716363489; cv=none; b=YyFJcVeybCxvG2n1DFQOZ9LU87HsVM+JGmArSfK7rDjFF9qIuxU/CElkwKN3U4FvQP+I8P4FJ+fBkv9qSghV2OZ4aDe3WtReEitgAadMhNptG3L1uFFfFvqL+2O6mOi/4Wn6sm/2Zyu7ZDh3cQs8+JQ65KIzAE+ZQfYF29qQ2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716363489; c=relaxed/simple;
	bh=3xt+u96jXZ59FbRvrhmh9xYTdFn2FP/K36lppdtoRfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRsMLA7r9BFK9WG9k39msneK6h8r61Ull1dubDl/2z2XH5Mhg750y4ka3c5K/TNWUf6IZPAqPMgprWUq31mtCzY8Gu69u34uK8BaIpe+gEqgw9ek6XYufF9F1l8asA8o4D0VQJVn0JJa/5RtNX+lxG/WxYItMsoKWC/J+ZGakJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oa3rl+Gw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oa3rl+Gw"
Received: by smtp.kernel.org (Postfix)
	id 7A316C32789; Wed, 22 May 2024 07:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B98C2BD11;
	Wed, 22 May 2024 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716363488;
	bh=3xt+u96jXZ59FbRvrhmh9xYTdFn2FP/K36lppdtoRfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oa3rl+GwKb2SpUnKLijfYlsuxUqhm1yWOkqr5AspgSmULPSxXwJJkQoujWzkWIpfX
	 B8nQWnzkTPY2uTSBdKiaCMp6YKHxKvUZCqKIiTTKukAImzPaNLun9NvpQbuH05jyP6
	 63sDsy2UTGjFB+p6eH4yHQpAYNS//Db+sTekBLNRfQgdeBJvqDur6J8B/MD891rzXS
	 0fSP3hNJS6dfJLCaDpqmfLkx13Cq1mEmAXwezmMu3WNriT3m2j8v5zjH0c0tR8wi6w
	 MqNwi8LlcQntXL48dh3LB8DTO9fObLiI8N/GpSwvdLvlrvEQh2u9wxblTf8IIGPoAy
	 CLSbKVcbQOVvw==
Date: Wed, 22 May 2024 09:38:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 adds changelog before the cover letter
Message-ID: <20240522-mindful-dynamic-wolverine-3adcb6@houat>
References: <20240521-curious-obedient-dove-cc79a8@houat>
 <20240521-silky-natural-tapir-80defb@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="htdn3czbudkarfuy"
Content-Disposition: inline
In-Reply-To: <20240521-silky-natural-tapir-80defb@lemur>


--htdn3czbudkarfuy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 01:44:04PM GMT, Konstantin Ryabitsev wrote:
> On Tue, May 21, 2024 at 12:38:57PM GMT, Maxime Ripard wrote:
> > I've just noticed that after sending a series, b4 add the changes=20
> > before
> > the rest of the cover letter.
> >=20
> > For example, I've just sent this series:
> > https://lore.kernel.org/r/20240521-kms-hdmi-connector-state-v14-0-51950=
db4fedb@kernel.org
> >=20
> > Prior to sending the series, this was the commit containing the cover l=
etter:
> > https://github.com/mripard/linux/commit/062e28a73fd2
> >=20
> > Right after b4 send was done, this is now the commit:
> > https://github.com/mripard/linux/commit/0d20a4123b4435c41177e2cc9122f7d=
335f7399e
> >=20
> > It's not clear to me what is going on, but other series on other
> > machines with the same system and b4 versions don't show the same
> > behaviour, so it's probably an unlikely bug, or related to the local
> > configuration.
>=20
> This is because normally there would be a --- between the trailers and=20
> the changelog, e.g.:
>=20
>   Cc: linux-rockchip@lists.infradead.org
>   Cc: linux-sunxi@lists.linux.dev
>   Signed-off-by: Maxime Ripard <mripard@kernel.org>
>   ---
>=20
>   Changes in v14:
>=20
> That "---" is crucial for us to properly find the start of the changelog=
=20
> section. This logic can certainly be improved to be less fragile, but=20
> for the moment putting back the --- is the only way to fix this for you.

Oh, of course. Thanks :)

Maxime

--htdn3czbudkarfuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk2g3QAKCRAnX84Zoj2+
dqPNAYCXCEy7TWDd7KtUS6GXFrRw0iY/0rb++4dr/5xsOB9Kk2WyUxBp1rsV6H1U
jaKV1ZUBfiUXTtkCrQYgF425dS9Raua3iv1izNKTPe8UzRR1N4vJyNgfH8Gu3i0T
DixUk70Lag==
=/dM6
-----END PGP SIGNATURE-----

--htdn3czbudkarfuy--
