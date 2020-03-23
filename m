Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58000.1584983115045470111
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 10:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DE87FEC;
	Mon, 23 Mar 2020 10:05:14 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12A103F7C3;
	Mon, 23 Mar 2020 10:05:13 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:05:12 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 message ID shortening
Message-ID: <20200323170512.GF4948@sirena.org.uk>
References: <20200323125456.GC4948@sirena.org.uk>
 <20200323163859.xyntfstr5o2uv55q@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200323163859.xyntfstr5o2uv55q@chatter.i7.local>
X-Cookie: Stay on the trail.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 30
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline

--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 12:38:59PM -0400, Konstantin Ryabitsev wrote:

> It doesn't really shorten it as much as it tries to create a descriptive=
=20
> enough "slug" that is supposed to help you identify the content by just=
=20
> looking at your dir listing.  How about we throw in the patch/cover=20
> title, e.g, for that particular case the slugs would be:

> 20200320_gustavo_spi_spi_s3c24xx_replace_zero_length_array_with_flexible_=
array_member.mbx

> and

> 20200320_gustavo_spi_spi_fsl_lpspi_replace_zero_length_array_with_flexibl=
e_array_member.mbx

> This used to be the scheme in early revisions, except filenames ended up=
=20
> being freakishly long. An option is to truncate them if they go over a=20
> certain length.

That looks good for my usage, long filenames aren't a concern for me but
I can see some people might not like them (perhaps a configurable
length, or perhaps that's overthinking it?).

> > it generates the same filename and silently overwrites the first
> > mailbox.=20

> I can do the -1.mbx, -2.mbx, etc when we find existing files, but I'm=20
> worried this will be annoying for people who are rerunning the same=20
> series for the purposes of adding other flags. On the other hand that=20
> would be safer.

Yes, and indeed I do use the overwriting behaviour myself if for example
new tags come in before I actually process the mailboxes.

> If we have more disambiguated .mbx names, would you still prefer not to=
=20
> overwrite existing .mbx files?

I think it's the silent bit as much as the overwriting bit that caught
me out - I didn't notice that it had overwritten the existing mailbox,
if it had said something about replacing an existing mailbox I'd
hopefully have seen that.

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl547EcACgkQJNaLcl1U
h9DKuQf/UgCD49PyPWCrzWCszevD8jGjfFwyuB8SeZKP9VKQXNSKQS8APqVwAGdZ
R+QdqobX+OTOqwV0Emr5F61F/ADpk0UahPCStdmLj7TrEerNCRCR3t6UY+Ibeu7f
gOPP0ayVl8x4QFmc+82Vw6fc7ikIZ/j0kwwB+DqNc4uszXY3omnmOYFgLHQ/eS1a
mzWby1tAdTB2AKCozZEoF8bOJfjhPGFc3xCBSYGahbhuKpdBR+11znuznevKJe/x
QWyuzGPusf4J+wOzR8bRAzxcp07TNu6eDG0Bli8NJWBUUEc3drrXjcCtkGY5ZrqT
bc93MEKPMVt1MsqxgZQVAGK/H/zfjw==
=lIgQ
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
