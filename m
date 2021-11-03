Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1AB68
	for <tools@linux.kernel.org>; Wed,  3 Nov 2021 01:29:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id b11so1046144qvm.7
        for <tools@linux.kernel.org>; Tue, 02 Nov 2021 18:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=aRm166c5m7rJA3kmEVuMTJ83wUtHrE5bzBv4wDzQ3zQ=;
        b=dzpBhAixbK+6sbZa11JvUVgebrvYSxt7J7orks1aUcvLNmSiLQVjvw3mOeWijKkgaP
         rVf0NjLOgWeQiD9B+jWSXuwpLE6pWK3WTPd6TK0/wZwFG0yrdP7d030Denzv6MRqUwkN
         fyATJOXSQ0LciciJyXSX6NIb+RZzKU3afgQgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aRm166c5m7rJA3kmEVuMTJ83wUtHrE5bzBv4wDzQ3zQ=;
        b=ES5V+gEiu7KtC+4nwpHKBYCY0pFG1K9tHrUoJW3pcwxiqYh166Cz5YmANUR1+L/BpU
         QNJCa+LVmR2Y2M91zobVMm0yUIJARHLH/4a1I5Ucz7JienWLhYpzqQc6h2ymxJ/Dk7RJ
         06X/0WCCmF/EARmENDqYkEfb5matYC3s5gxJ05YG2lVbhMQcd6qJqrH4Yz2QdVe6SJP6
         2K8kn+/I6t/s4Ev0+rQlpQnCGc6isFgFeyKsFgcPwxuZdArV/A2V7yKlnlAZl6ddj65Y
         VMaVqtKoikN8TrMFJcpp0C1OWNNgb4cNT3FQBA6NVBEYoI7qt2/IKhPov1FMdc6ZcnVU
         GGNA==
X-Gm-Message-State: AOAM533md7XmIr4R62JLT2gd5x5ATcDQOhqB9rnl1jpsZ7ub+5YeUZ8+
	lXCU45XdRuSqHzTkcgcVx+eAwvGMrWVNsQ==
X-Google-Smtp-Source: ABdhPJxSGqZkgkDOf6izHIY65XqL6K7qYP6mXQDjBrfaFH6vnmvVaVODEZ1qA5ssQexePJaKNV/wCA==
X-Received: by 2002:ad4:4d81:: with SMTP id cv1mr27083269qvb.60.1635902940436;
        Tue, 02 Nov 2021 18:29:00 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id u9sm519594qta.83.2021.11.02.18.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:28:59 -0700 (PDT)
Date: Tue, 2 Nov 2021 21:28:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: meta@public-inbox.org
Cc: tools@linux.kernel.org
Subject: Initial Fedora packaging for lei
Message-ID: <20211103012858.euqpkj756qexwdup@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4u67wi67lcdmpfba"
Content-Disposition: inline


--4u67wi67lcdmpfba
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I did some initial work to package lei for Fedora 34 and 35 (out today). The
lei parts should be ready to use, though I'll continue to work on the server
parts (only needed if you're running httpd/nntpd/imapd daemons).

For now, you'll need to enable my copr repository to use it:

    sudo dnf copr enable icon/b4
    sudo dnf install lei

(you can also install python3-b4 from there if you're using b4)

I'm still working on some introductory docs, but you can use the following
resource to get yourself going with search-based lei goodness:

https://josefbacik.github.io/kernel/2021/10/18/lei-and-b4.html

-K

--4u67wi67lcdmpfba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYYHl1gAKCRC2xBzjVmSZ
bBhIAP9zdnDcMgW5BEhq51+DeuZIbkGCGdsP8NetGbHH8r3ErgD+Iwaw7BymNV8T
NLp+GLYmLIXezClLA+h/13lRPu5vcgM=
=jNDR
-----END PGP SIGNATURE-----

--4u67wi67lcdmpfba--
