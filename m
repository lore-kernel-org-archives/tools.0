Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9E2FE04B
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476245; cv=none; b=InmoBcMCTpYRfKx9JcipOYH38OqntH8DgTFEfVlsJ7ofuwK+MjWQdOh7wVVTfmzDcmU33IeTBfmRbBYR4OuB5p5JJ4kX8QEqOk2kK3osT4x7spqv5czrTjCgolX/v9NWA/Cim93W4w0lFR8rOU78ppbP5Q4EwPPPafglUh5bZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476245; c=relaxed/simple;
	bh=GK7V/wCjh1z3GcZklIiGAACPdFcb1Q0CVZymFo5il1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZavAzXRgSBlzZaC6tPK3LL58lcqAmzB+ltsn1mUFz4ADZRHJ6YvznRVtY/1e8slR89n0jYq1PAUl/612KX23aUf1Qkz8c6kPVuNIW9JHlF5CB0FtIzQR5J6othGW7OKL9WESRnTKYgHN+7YRSfTC7uZpzOzKPYDn5gCP/NeCBzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FSrEyDKY; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FSrEyDKY"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7900f7f4ba9so68064866d6.0
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760476242; x=1761081042; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GK7V/wCjh1z3GcZklIiGAACPdFcb1Q0CVZymFo5il1g=;
        b=FSrEyDKYvpZm1hpr4ibAY4Qy60pN3MutepHzHKPut0aMCUE2DmoHy5FVKxzTJ1ICfo
         y1LSA/pJHqcHbKBhpd2h0zr6hdr/w0iOyWpysumL948QlwhZIALD9qSJjOWI0GMxyE4z
         OTG4XAoXP1BwRFV1nFzxryVGPY8ebpUesXme5m5vi9kkwbgBOIi4PXCgU/4f/Y5gIXQQ
         Bpy6kwnNZ/3iZK2mw4qpxkCen3Pg8e5M93y4nwYWaUBfImH8HZGv4q/T6vfxA1LQkl2m
         Z7jg9f0lB3o5WBT5ajBN0TGoWxH9zglZ2sJm/fA6frfjr6CW6GJtqw6vQuSyqw5JjroX
         /5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476242; x=1761081042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK7V/wCjh1z3GcZklIiGAACPdFcb1Q0CVZymFo5il1g=;
        b=ghd7M9bmcw0D10iL3NBoLpdrJ99ZFg0uEzarQoi6TY/gZoAXdb30RJwJOB5Y33eY3u
         uM8tXEtliAzKop/4CoA85HelyR1dTNURMh/PpouzYCKzTENfNEX3DZaS8MNd0hwVFxvd
         eHKRZYWuAWJHMAKlUZeJyUGuAuLj7kFUWAEQRvIiq9DFzvB+S2Z3DHr+F5TQqZ8f/mgJ
         nnrKtx6k5wUvAQ3+EyAH7ponlm4z2lXjaFPIQKeaWz0KgkohRVqrdcqy+M4srhxqNewV
         tGQOgj50qUOV2o493MGp59tOdUHI0WQa7hWZegDVuXzDI78XlzOFgUDQNuzNZOvyq64d
         mF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv3YIBnxraFv7sC1BF7slzxa+RWydwO+aClx5Dkzul9Bb9Glus2nnZ6hD/NxA9hjm4Oe+iag==@linux.kernel.org
X-Gm-Message-State: AOJu0YxbTw5PTYIIEf7BEkWDSMP07fmg88q3V0lHzdMTLTcm4FkJqwcV
	3xBgWvM5xKiViNWjdFMVVHV2yS+swJlmjpcmq1p7imkglpyBPLoFZC8YNaE0UviJJHw=
X-Gm-Gg: ASbGncsz7eT6uyKkszVL+c5RgsIttlEb8o3KvFGCcUJ/AobESQ5b412/RjieNyukSzO
	wYeIuud6I6LKct5OZjNJdmvAt/zXbVAiyEt5VyLNkcNQYGZ/C86jLcAeOSjbNd1pPUPYCLSVPqU
	XymzhOmRRhhNtPWTC0sN4mOHHX3C7vGZT3Z0KA8o9Q6QpGZE8k/8e0naTxVfCCjDaIOUEAWvtSM
	P2xwMzEjlsOawTD+awZRXB84Sp1V1pmiURtzxOQwxHsSQLO84ihDe67siNDM20EdXaclFMART0e
	IjEFS7M0j3tokOsm2y3ksmPAzCAGRybkft0wXGcrASrHn2wFTj3FnPx6kEHiyTWNHC93iRpuIJS
	z7OQSMpq3zhkuJZVa+F6scHHegw==
X-Google-Smtp-Source: AGHT+IHj7McU8NaaqblRUKyk0zN5Nv+nzORt+ufIpvcbz0BAo4r+xkOXG8hpm2LojcflqFEvp14GKA==
X-Received: by 2002:a05:622a:343:b0:4ce:6ded:dba4 with SMTP id d75a77b69052e-4e6eacf6addmr364809721cf.19.1760476241815;
        Tue, 14 Oct 2025 14:10:41 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881d2959dsm5562601cf.38.2025.10.14.14.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 14:10:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v8mI3-0000000HI88-3Vwa;
	Tue, 14 Oct 2025 18:10:39 -0300
Date: Tue, 14 Oct 2025 18:10:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251014211039.GD3938986@ziepe.ca>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org>
 <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org>
 <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
 <aO6Q8A5DKNA-g1Fa@agluck-desk3>
 <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>

On Tue, Oct 14, 2025 at 11:41:08AM -0700, Linus Torvalds wrote:
> And I'm arguing that if there were multiple submissions, those earlier
> submissions are relevant and interesting and often have *MORE* email
> replies associated with them than the final one.

Yes, and for this reason I always link back to the prior versions from
the cover letter of the latest.

This way you can go from the Link: header, into Lore, click to the
cover letter see the change log and then click through all the other
versions of the series without having to rely on any heuristics or
special tools.

I know many others do the same but we don't have a best practices
document to say to do this.

Jason
