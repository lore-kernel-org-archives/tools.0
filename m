Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F46D22
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 13:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23A9C433EF;
	Tue,  4 Apr 2023 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680614793;
	bh=kj4jD1qtOvZyENtgr39b2dMP4xyFi5kyhnbwdo0tk28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=al6wtrtHR9QIB5BH9bAPGGaIJNARPiZyipgbg6pKFImSlFREvw5soo2bv2nHpZAw/
	 S2qXAcBz6R/vvjVV1eQCJNNQZkNO7CbZK07etcBAY8ytBAYg2N6U4tueBCW2l3m8r3
	 QhAoksrNki4WX7a/q3Y2ZXdnApxYu1AKhXgGKfR+Uuo5acyGo3cTL5fAWkJ88szuqk
	 xoFKdwSyJE6bm49P18Z3fBov3fZ0TqOwoE/Btceot/a+vIXbsa4CMXM/DThvqbCgdZ
	 +7239hkMFTDIpWhDbMk+PQttFB/aQx9bYxsPOyGO57I1KL6yfjFNNj9yTUuv4p+KLC
	 H2NK4GZ7Wms8g==
Date: Tue, 4 Apr 2023 14:26:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 having trouble parsing recipients from cover
Message-ID: <ZCwlhTvZhpVXBj6/@sirena.org.uk>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
 <20230404-bacteria-refinery-a97393@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F+owoMtDew7u+H8Y"
Content-Disposition: inline
In-Reply-To: <20230404-bacteria-refinery-a97393@meerkat>
X-Cookie: Being ugly isn't illegal.  Yet.


--F+owoMtDew7u+H8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've got a cover letter commit for a single patch with the contents:

    # Lines starting with # will be removed from the cover letter. You can
    # use them to add notes or reminders to yourself. If you want to use
    # markdown headers in your cover letter, start the line with ">#".
   =20
    # You can add trailers to the cover letter. Any email addresses found in
    # these trailers will be added to the addresses specified/generated
    # during the b4 send stage. You can also run "b4 prep --auto-to-cc" to
    # auto-populate the To: and Cc: trailers based on the code being
    # modified.
   =20
    To: Liam.Howlett@Oracle.com
    Cc: linux-mm@kvack.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Mark Brown <broonie@kernel.org>
   =20
    Changes in v2:
    - Don't set index and last again needlessly.
    - Link to v1: https://lore.kernel.org/r/20230403-regmap-maple-walk-fine=
-v1-1-09512dd51e50@kernel.org
   =20
    --- b4-submit-tracking ---
    # This section is used internally by b4 prep for tracking purposes.
    {
      "series": {
        "revision": 2,
        "change-id": "20230403-regmap-maple-walk-fine-982bbd2dcfe5",
        "base-branch": "work",
        "prefixes": [],
        "history": {
          "v1": [
            "20230403-regmap-maple-walk-fine-v1-1-09512dd51e50@kernel.org"
          ]
        }
      }
    }

but when I try to run b4 send it says:

  Converted the branch to 1 messages
  CRITICAL: Could not find any destination addresses (try: b4 prep --auto-t=
o-cc).

which I don't understand.  I'm using current b4 master.

--F+owoMtDew7u+H8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsJYQACgkQJNaLcl1U
h9BYIAf+Loh4AoTZoBnAH77PDR8KenLDtijrU1E19DU0lYLo/zGoIuczVZ3ltGLc
D3Tmy/+l8rvwoXylbQoIHWi6uxn3fdffnvSEmXYjqELOqyLsHL2xNt/0/DsI31hT
bs3oWgNtCulb/k9BCVowJm0rBZ7GkNxeK43Yf5cl7UKwRXPlORGxtE3JDDLavDkT
WKLSfx6GCvBrafbcxEJkztzzrGA4nd9f49UCsZNPyL1FR6z+rSR1bl+abG6rrjvy
nXa1UeINPCGumiQWSdzGkghc8wMmKsTG9BEq1yayKPwwHFK3/5vQaAbt+EkadehP
aqtYTbWxsTkMbzdHpVHWofH4ugtlcA==
=p7bK
-----END PGP SIGNATURE-----

--F+owoMtDew7u+H8Y--
