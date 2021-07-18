Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3972;
	Sun, 18 Jul 2021 04:45:24 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1626583522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9LOJ+xim1P4Q8189TYZ2VTDjzElwXPo/hPwjBwdJmg=;
	b=GUrrKCIGrD7AB/slVV5sxUoeisWz4d3Vd3NRw6rPnS+RBh8uPHEaTZbrfRYQjqw6QQpW/0
	cfW4fKv802dBLYLIbCVdeqYRaVRItRmrxLLOdJYZOZkSdnHYdDNbT8U+KdsRcuWUU+tl17
	6GLBcjBPckbPQe7UJOoXJVJt+EpzEZrulgzydNrQG8wZXTKh6P5ZVxzWgbe5kckie2/rw6
	GYxZ7TN0wVcy4xeBlwlWTKqYCbI0hHmyikuE8vCmMo9708py4RGSAXps5cEyUYDfQi6mFK
	PXv2EeXI9pswgKDnnKwDL3MuJ+4CiY60TZ4M2+XBo8uLlZ5srHSSmp3z6E/LPg==
From: Kyle Meyer <kyle@kyleam.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [PATCH b4 2/2] Parse just headers when extracting message ID
 from stdin mbox
In-Reply-To: <20210718043406.26727-3-kyle@kyleam.com>
References: <20210717212631-mutt-send-email-mst@kernel.org>
 <20210718043406.26727-1-kyle@kyleam.com>
 <20210718043406.26727-3-kyle@kyleam.com>
Date: Sun, 18 Jul 2021 00:45:20 -0400
Message-ID: <87y2a444db.fsf@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Kyle Meyer writes:

> diff --git a/b4/pr.py b/b4/pr.py
> index fbb2a71..e52c2ab 100644
> --- a/b4/pr.py
> +++ b/b4/pr.py
> @@ -433,7 +433,10 @@ def main(cmdargs):
>  
>      if not sys.stdin.isatty():
>          logger.debug('Getting PR message from stdin')
> -        msg = email.message_from_bytes(sys.stdin.buffer.read())
> +        from email.parser import BytesHeaderParser
> +        from email.parser import BytesHeaderParser

Doh, there's a repeated import here :/
