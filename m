Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F32EEE68
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558099; cv=pass; b=OfTPISBG7Ov6AXuW14leiA0T+JZ6vbWhvCHGgX+IvYxIzUr3q4ZutTuGCy7lCTALuri6ioAAZlqP73Xp3PNtsqQGf6CLiG07BirRZZ5BJKqjnsBp3tO3yOgR+6qs0Wc51ERBNh4vtNPrRvijw7EdrcVPBa/K7TPLxOudsN5SLTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558099; c=relaxed/simple;
	bh=va4AT3NcIVR4jat85ObEV48DvNJFBXHI/1RC4hjhcPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bwiROqjw9Vgla+zvexapzQYCsXXMOSR6v3mRTNgK/A3yX1dv0/X8zerFHOt2RgNvokZwblqE3m2QoQ2OPQ4p2tU0FV3V2a0zFO+tdHKW/nuKVLuAgg9AQHD73aDInJusWuyTBi9mDvo+T1P8tsYPrqm2wIfIX/Un224sjD3WhKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z67JYVnO; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z67JYVnO"
Received: by smtp.kernel.org (Postfix)
	id 5E1631F00A3D; Mon, 15 Jun 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781558097;
	b=WbYZCXk1chle1L4iTIIAuJIgstDz+5X0637f9Z9R8OyK4oi6YLon7Rh5NBC8AsFqCS4u
	 bpTmWq4zSRNgLOB0/6HWKEVwbJTl01kGngusbbEprJHHMquApQG2Fmr9bz8yyCkUnPqk7
	 PPvrZMOBviP8j1+DyKG4PF5CTrY/MxE1Qd0qSBOYVn4WA0It4sls8Pha88t9cXsWizQro
	 gIqEgeedqwP7/9zELrvI6zkmAzyiM7b8o1GL+oQzfTNFQkTiLQIrMEDrvqtMuO5Uk1x0J
	 8TjuOF3tcjqI7F4djdxKhyvTSDOCjpbArdlQWFIYuDA7zpw4xGNckREnNuF6Cr2MupA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781558097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dYmAvOQTihE6SGMfQXy1a4SFQ2RuNDjO2iktbUnXEDw=;
	b=zo7KhIc697wzfh5VTK3dMGlcUK6umtsIXkByWt+FykxeqBDbg5G/wb4ubmS+IzEV4aO1
	 hcw53D3xZw3s82/xBiDlgDHc4gzjF0V60229cztN8eub9tLaozPveq942tQR9bqntlB8+
	 +pAZUUkMzaUVZw+v+/Yl45kLHjzkGS/wdat7JxSv2MzD8ZD5PUCOyw5xtURgOcngiTfs2
	 51ax8NBXFfRGkLlx+Qt92RaGLQA9LZqZP3FBf0df6kPGE2RafLsUCutqUChiANa+CrvyO
	 5sdLbfvQ2mYBHiB5Cw6XZY4JMcMbUTBpFIRJvmoEq0CMnSjaoJPEo7JrZLDSdAecZUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z67JYVnO;
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D63D81F000E9;
	Mon, 15 Jun 2026 21:14:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z67JYVnO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D63D81F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJIE983334194;
	Mon, 15 Jun 2026 21:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=dYmAvOQTihE6SGMfQXy1a4SFQ2RuNDjO2iktbUnXEDw=; b=Z67JYVnO
	3XNQ8wYtxwIs25JtgyFl2lHVleOXyNikWF+35rwrTlz7MoyskOfyVGNxYQkj53Tg
	YnnSfqtVxXduHb67+dfBkLu0jXhu+QbMmCqN7L2zBo+AzB4mhOU9zhQaAiSbJLnl
	/qubZeQ+HPXdVj2dT4Th64FHOw9UeJqW3pO0IM/cM1EBjlYRyLXxUBygvHjxAwdq
	LAFu92ajS4obCIlVk0OtixxxdlZb4iPlFVfFPyDU0AarhGwWAxK3SQ6iamP3tk21
	19ZO8wdGU+DmlD/eBZGtMtxKUmM4DCrfqUcPqpQAnzLo/0KbaX0BUi/E9xU5fYrz
	Px4+tYXU0S/JSg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4es1u0j6cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 21:14:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FL4gBW001467;
	Mon, 15 Jun 2026 21:14:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4esm7y0684-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 21:14:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65FLEqiq56820206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jun 2026 21:14:52 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7220958043;
	Mon, 15 Jun 2026 21:14:52 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09BB258059;
	Mon, 15 Jun 2026 21:14:49 +0000 (GMT)
Received: from d (unknown [9.61.47.236])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Jun 2026 21:14:48 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [Tyrel Datwyler] Re: [PATCH v2 6/7] ibmvfc: register and use
 asynchronous sub-queue
Date: Mon, 15 Jun 2026 16:14:48 -0500
Message-ID: <87h5n3o69j.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O8nxymFLF7CiR3BIIr7kpooGOhLC1ns8
X-Authority-Analysis: v=2.4 cv=XdK5Co55 c=1 sm=1 tr=0 ts=6a306b4e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=bLk-5xynAAAA:8 a=yPCof4ZbAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=voM4FWlXAAAA:8 a=DOIikO88_UUS13iR5CQA:9
 a=zSyb8xVVt2t83sZkrLMb:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIyMCBTYWx0ZWRfXzp+bB2SYvA7Q
 N+XJmlQoknWykeU4Umarh2BXGMUkw+Wg+L7ktkiYHijH0ma9A8fK8V0WQUntQ9N1IV4pCOgG+lq
 dkOgf8SLM083QlIpo5kWQvl6HdAkDzgceAmbzxCm52SA6YfE3evPhRtDATA7J21m7OMuoxiTW3C
 tvpjku+HD250j6rZiUUWhjBL5sbJq7ZhsJG9NiyN8sTPBvQGofSPFdEBPhWDdU1nk7V1Pn3ktZF
 MwQIS/jA+W0yyJLEryKtchMQKeH1+zhwwJZvDkDfg4VNLfEJkb880p7t22ad9nAt66M3f1q87f6
 fC9WGJJJM9tOWHWrF2AvJT6TPyfIGPTUetrzeSEUZnF6yHmzhrHnoJ18LL/bPK515MKQ8pxBnb3
 clDu3CGJd9eHL35Wdk6l8rSgewszeSEn1IoN0FLICV1Iz51dsMCeV8OJIY1+2zOytijVfMWCPpZ
 UiWV0GRQOoLlGC28Wag==
X-Proofpoint-ORIG-GUID: O8nxymFLF7CiR3BIIr7kpooGOhLC1ns8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIyMCBTYWx0ZWRfX+ZwqDk/978fT
 G18/sEZkcv5lP/Vs0zVkXy91w1W3gfH1tIf55CnnyCuMWhS+Gc2p5lzXjGGsgwylkkN+veZw+RX
 J70/zJho/dWjVYnCy5yPqQ/tvfg7KVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150220


Hi Konstantin. I'm using b4 to send patch series. I get these comments
about not having a Signed-off-by: tag. Should the tag be added by b4? Or
should the patch attestation be enough?

I do notice that "b4 prep --check" flags some patches as missing the
Signed-off-by: tag, particularly when I've chosen to not fix some
warnings.

-------------------- Start of forwarded message --------------------
Date: Mon, 15 Jun 2026 13:58:18 -0700
Subject: Re: [PATCH v2 6/7] ibmvfc: register and use asynchronous sub-queue
To: davemarq@linux.ibm.com,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Brian King <brking@linux.ibm.com>,
        Greg Joyce <gjoyce@linux.ibm.com>,
        Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>

On 6/8/26 11:30 AM, Dave Marquardt via B4 Relay wrote:
> From: Dave Marquardt <davemarq@linux.ibm.com>
> 
> Refactor existing code for async events into a common routine,
> register a channel and interrupt handler for the asynchronous
> sub-queue, and set capability bits to request that VIOS use the
> asynchronous sub-queue.

Again, all your patches need Signed-off-by: tags to be accepted.

Also, there is still a lot of different things happening in this patch

You seem to be reworking the fpin_desc helpers which I'm not really seeing any
reason that you couldn't squash those changes into patch 2. It seems like
needless churn since, unless I'm missing something, there doesn't seem to be any
new definitions added since patch 2 just reworking of the input parameters such
that period goes away and is hardcoded and a new type paramerter is added.

I would also help reduce the patch size and make it more reviewable if you split
the the interrupt handler definition and queue registration into separate
patches as well.

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c       | 376 +++++++++++++++++++++++++++--------
>  drivers/scsi/ibmvscsi/ibmvfc.h       |   3 +
>  drivers/scsi/ibmvscsi/ibmvfc_kunit.c |   2 +-
>  3 files changed, 298 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ad1f5636e879..a2252cd2f44b 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -1514,7 +1514,8 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
>  	login_info->max_cmds = cpu_to_be32(max_cmds);
>  	login_info->capabilities =
>  		cpu_to_be64(IBMVFC_CAN_MIGRATE | IBMVFC_CAN_SEND_VF_WWPN |
> -			    IBMVFC_CAN_USE_NOOP_CMD);
> +			    IBMVFC_CAN_USE_NOOP_CMD | IBMVFC_YES_SCSI |
> +			    IBMVFC_USE_ASYNC_SUBQ | IBMVFC_CAN_HANDLE_FPIN);
>  
>  	if (vhost->mq_enabled || vhost->using_channels)
>  		login_info->capabilities |= cpu_to_be64(IBMVFC_CAN_USE_CHANNELS);
> @@ -3240,8 +3241,8 @@ static size_t ibmvfc_fpin_size_helper(u8 fpin_status)
>   * non-NULL - pointer to populated struct fc_els_fpin
>   */
>  static struct fc_els_fpin *
> -ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
> -			   __be32 period, __be32 threshold, __be32 event_count)
> +ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 type, __be16 modifier,
> +			   __be32 threshold, __be32 event_count)
>  {

This function signature changes here, and looking at the implemenation below I'm
struggling to see why this couldn't just be all implmented immediatly in Patch #2.

>  	struct fc_fn_peer_congn_desc *pdesc;
>  	struct fc_fn_congn_desc *cdesc;
> @@ -3253,7 +3254,7 @@ ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
>  	if (size == 0)
>  		return NULL;
>  
> -	fpin = kzalloc(size, GFP_KERNEL);
> +	fpin = kzalloc(size, GFP_ATOMIC);

Why are we changing this to GFP_ATOMIC? Isn't this only ever called from work
queue context?

>  	if (fpin == NULL)
>  		return NULL;
>  
> @@ -3266,12 +3267,9 @@ ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
>  		cdesc = (struct fc_fn_congn_desc *)fpin->fpin_desc;
>  		cdesc->desc_tag = cpu_to_be32(ELS_DTAG_CONGESTION);
>  		cdesc->desc_len = cpu_to_be32(FC_TLV_DESC_LENGTH_FROM_SZ(*cdesc));
> -		if (fpin_status == IBMVFC_AE_FPIN_CONGESTION_CLEARED)
> -			cdesc->event_type = cpu_to_be16(FPIN_CONGN_CLEAR);
> -		else
> -			cdesc->event_type = cpu_to_be16(FPIN_CONGN_DEVICE_SPEC);
> +		cdesc->event_type = type;
>  		cdesc->event_modifier = modifier;
> -		cdesc->event_period = period;
> +		cdesc->event_period = cpu_to_be32(IBMVFC_FPIN_DEFAULT_EVENT_PERIOD);
>  		cdesc->severity = FPIN_CONGN_SEVERITY_WARNING;
>  		break;
>  	case IBMVFC_AE_FPIN_PORT_CONGESTED:
> @@ -3281,12 +3279,9 @@ ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
>  		pdesc = (struct fc_fn_peer_congn_desc *)fpin->fpin_desc;
>  		pdesc->desc_tag = cpu_to_be32(ELS_DTAG_PEER_CONGEST);
>  		pdesc->desc_len = cpu_to_be32(FC_TLV_DESC_LENGTH_FROM_SZ(*pdesc));
> -		if (fpin_status == IBMVFC_AE_FPIN_PORT_CLEARED)
> -			pdesc->event_type = cpu_to_be16(FPIN_CONGN_CLEAR);
> -		else
> -			pdesc->event_type = cpu_to_be16(FPIN_CONGN_DEVICE_SPEC);
> +		pdesc->event_type = type;
>  		pdesc->event_modifier = modifier;
> -		pdesc->event_period = period;
> +		pdesc->event_period = cpu_to_be32(IBMVFC_FPIN_DEFAULT_EVENT_PERIOD);
>  		pdesc->detecting_wwpn = cpu_to_be64(0);
>  		pdesc->attached_wwpn = wwpn;
>  		pdesc->pname_count = cpu_to_be32(1);
> @@ -3297,7 +3292,7 @@ ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
>  		ldesc = (struct fc_fn_li_desc *)fpin->fpin_desc;
>  		ldesc->desc_tag = cpu_to_be32(ELS_DTAG_LNK_INTEGRITY);
>  		ldesc->desc_len = cpu_to_be32(FC_TLV_DESC_LENGTH_FROM_SZ(*ldesc));
> -		ldesc->event_type = cpu_to_be16(FPIN_LI_UNKNOWN);
> +		ldesc->event_type = type;
>  		ldesc->event_modifier = modifier;
>  		ldesc->event_threshold = threshold;
>  		ldesc->event_count = event_count;
> @@ -3331,9 +3326,47 @@ ibmvfc_common_fpin_to_desc(u8 fpin_status, __be64 wwpn, __be16 modifier,
>  static struct fc_els_fpin *
>  ibmvfc_basic_fpin_to_desc(struct ibmvfc_async_crq *crq, u64 wwpn)
>  {
> +	__be16 type;
> +
> +	switch (crq->fpin_status) {
> +	case IBMVFC_AE_FPIN_LINK_CONGESTED:
> +	case IBMVFC_AE_FPIN_PORT_CONGESTED:
> +		type = cpu_to_be16(FPIN_CONGN_DEVICE_SPEC);
> +		break;
> +	case IBMVFC_AE_FPIN_PORT_CLEARED:
> +	case IBMVFC_AE_FPIN_CONGESTION_CLEARED:
> +		type = cpu_to_be16(FPIN_CONGN_CLEAR);
> +		break;
> +	case IBMVFC_AE_FPIN_PORT_DEGRADED:
> +		type = cpu_to_be16(FPIN_LI_UNKNOWN);
> +		break;
> +	default:
> +		return (NULL);
> +	}
> +
>  	return ibmvfc_common_fpin_to_desc(crq->fpin_status, cpu_to_be64(wwpn),
> -					  cpu_to_be16(0),
> -					  cpu_to_be32(IBMVFC_FPIN_DEFAULT_EVENT_PERIOD),
> +					  type, cpu_to_be16(0),
> +					  cpu_to_be32(IBMVFC_FPIN_DEFAULT_EVENT_THRESHOLD),
> +					  cpu_to_be32(1));
> +}
> +
> +/**
> + * ibmvfc_full_fpin_to_desc(): allocate and populate a struct fc_els_fpin struct
> + * containing a descriptor.
> + * @ibmvfc_fpin: Pointer to async subq FPIN data
> + *
> + * Allocate a struct fc_els_fpin containing a descriptor and populate
> + * based on data from *ibmvfc_fpin.
> + *
> + * Return:
> + * NULL     - unable to allocate structure
> + * non-NULL - pointer to populated struct fc_els_fpin
> + */
> +static struct fc_els_fpin *
> +ibmvfc_full_fpin_to_desc(struct ibmvfc_async_subq *ibmvfc_fpin)
> +{
> +	return ibmvfc_common_fpin_to_desc(ibmvfc_fpin->fpin_status, ibmvfc_fpin->wwpn,
> +					  cpu_to_be16(0), cpu_to_be16(0),
>  					  cpu_to_be32(IBMVFC_FPIN_DEFAULT_EVENT_THRESHOLD),
>  					  cpu_to_be32(1));
>  }
> @@ -3344,67 +3377,99 @@ ibmvfc_basic_fpin_to_desc(struct ibmvfc_async_crq *crq, u64 wwpn)
>   */
>  static void ibmvfc_process_async_work(struct work_struct *work)
>  {
> +	struct ibmvfc_async_subq_fpin *sqfpin;
> +	struct ibmvfc_target *tgt, *next;
> +	struct ibmvfc_async_subq *subq;
>  	struct ibmvfc_async_work *aw;
>  	struct ibmvfc_async_crq *crq;
> -	struct ibmvfc_target *tgt;
>  	struct ibmvfc_host *vhost;
>  	struct fc_els_fpin *fpin;
> +	__be64 node_name;
> +	__be64 scsi_id;
> +	__be64 wwpn;
>  
>  	aw = container_of(work, struct ibmvfc_async_work, async_work_s);
>  	crq = aw->crq;
> +	subq = aw->subq;
>  	vhost = aw->vhost;
>  
> -	if (!crq->scsi_id && !crq->wwpn && !crq->node_name)
> +	if ((!crq && !subq) || (crq && subq)) {
> +		dev_err_ratelimited(vhost->dev,
> +				    "FPIN event received, unable to process\n");
>  		goto end;
> -	list_for_each_entry(tgt, &vhost->targets, queue) {
> -		if (crq->scsi_id && cpu_to_be64(tgt->scsi_id) != crq->scsi_id)
> +	}
> +
> +	if (crq) {
> +		wwpn = crq->wwpn;
> +		node_name = crq->node_name;
> +		scsi_id = crq->scsi_id;
> +	} else {
> +		wwpn = subq->wwpn;
> +		node_name = subq->id.node_name;
> +		scsi_id = 0;
> +	}
> +
> +	if (!scsi_id && !wwpn && !node_name)
> +		goto end;
> +
> +	list_for_each_entry_safe(tgt, next, &vhost->targets, queue) {
> +		if (scsi_id && cpu_to_be64(tgt->scsi_id) != scsi_id)
>  			continue;
> -		if (crq->wwpn && cpu_to_be64(tgt->ids.port_name) != crq->wwpn)
> +		if (wwpn && cpu_to_be64(tgt->ids.port_name) != wwpn)
>  			continue;
> -		if (crq->node_name && cpu_to_be64(tgt->ids.node_name) != crq->node_name)
> +		if (node_name && cpu_to_be64(tgt->ids.node_name) != node_name)
>  			continue;
>  		if (!tgt->rport)
>  			continue;
> -		fpin = ibmvfc_basic_fpin_to_desc(crq, tgt->wwpn);
> +		if (crq) {
> +			fpin = ibmvfc_basic_fpin_to_desc(crq, tgt->wwpn);
> +		} else {
> +			sqfpin = (struct ibmvfc_async_subq_fpin *)subq;
> +			fpin = ibmvfc_full_fpin_to_desc(subq);
> +		}
>  		if (fpin) {
>  			fc_host_fpin_rcv(tgt->vhost->host,
>  					 sizeof(*fpin) + be32_to_cpu(fpin->desc_len),
>  					 (char *)fpin, 0);
>  			kfree(fpin);
>  		} else
> -			dev_err_ratelimited(vhost->dev,
> -					    "FPIN event %u received, unable to process\n",
> -					    crq->fpin_status);
> +			dev_err_ratelimited(vhost->dev, "FPIN event received, unable to process\n");
>  	}
>  
>   end:
> -	crq->valid = 0;
> +	if (crq)
> +		crq->valid = 0;
> +	if (subq)
> +		subq->valid = 0;
>  
>  	kfree(aw);
>  }
>  
>  /**
> - * ibmvfc_handle_async - Handle an async event from the adapter
> - * @crq:	crq to process
> + * ibmvfc_handle_async_common - Handle an async event from the adapter
> + * @event:	event to process
> + * @link_state:	link state
>   * @vhost:	ibmvfc host struct
> + * @scsi_id:	scsi_id (0 if not applicable)
> + * @wwpn:	wwpn
> + * @node_name:	node_name
> + * @aw_crq:	crq pointer for async work (NULL if not needed)
> + * @aw_subq:	subq pointer for async work (NULL if not needed)
>   *
>   **/
> -VISIBLE_IF_KUNIT void ibmvfc_handle_async(struct ibmvfc_async_crq *crq,
> -					  struct ibmvfc_host *vhost)
> +static void ibmvfc_handle_async_common(u64 event, u8 link_state,
> +				       struct ibmvfc_host *vhost,
> +				       u64 scsi_id, u64 wwpn, u64 node_name,
> +				       struct ibmvfc_async_crq *aw_crq,
> +				       struct ibmvfc_async_subq *aw_subq)

This is a lot of parameters which could be extracted here in the function if it
just knew the type of async_crq. Would it be easier to no just take a void
*async_instance parameter, and an is_subq boolean to determine if you cast the
void * to ibmvfc_async_crq * or ibmvfc_async_sub_crq *?
>  {
> -	const struct ibmvfc_async_desc *desc = ibmvfc_get_ae_desc(be64_to_cpu(crq->event));
> +	struct ibmvfc_target *tgt, *next;
>  	struct ibmvfc_async_work *aw;
> -	struct ibmvfc_target *tgt;
>  	bool clear_valid = true;
>  
> -	ibmvfc_log(vhost, desc->log_level, "%s event received. scsi_id: %llx, wwpn: %llx,"
> -		   " node_name: %llx%s\n", desc->desc, be64_to_cpu(crq->scsi_id),
> -		   be64_to_cpu(crq->wwpn), be64_to_cpu(crq->node_name),
> -		   ibmvfc_get_link_state(crq->link_state));
> -
> -	switch (be64_to_cpu(crq->event)) {
> +	switch (event) {
>  	case IBMVFC_AE_RESUME:
> -		switch (crq->link_state) {
> +		switch (link_state) {
>  		case IBMVFC_AE_LS_LINK_DOWN:
>  			ibmvfc_link_down(vhost, IBMVFC_LINK_DOWN);
>  			break;
> @@ -3419,7 +3484,6 @@ VISIBLE_IF_KUNIT void ibmvfc_handle_async(struct ibmvfc_async_crq *crq,
>  			__ibmvfc_reset_host(vhost);
>  			break;
>  		}
> -
>  		break;
>  	case IBMVFC_AE_LINK_UP:
>  		vhost->events_to_log |= IBMVFC_AE_LINKUP;
> @@ -3439,58 +3503,106 @@ VISIBLE_IF_KUNIT void ibmvfc_handle_async(struct ibmvfc_async_crq *crq,
>  		vhost->events_to_log |= IBMVFC_AE_RSCN;
>  		ibmvfc_reinit_host(vhost);
>  		break;
> +	case IBMVFC_AE_LINK_DOWN:
> +	case IBMVFC_AE_ADAPTER_FAILED:
> +		ibmvfc_link_down(vhost, IBMVFC_LINK_DOWN);
> +		break;
> +	case IBMVFC_AE_LINK_DEAD:
> +		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
> +		break;
> +	case IBMVFC_AE_HALT:
> +		ibmvfc_link_down(vhost, IBMVFC_HALTED);
> +		break;
>  	case IBMVFC_AE_ELS_LOGO:
>  	case IBMVFC_AE_ELS_PRLO:
>  	case IBMVFC_AE_ELS_PLOGI:
> -		list_for_each_entry(tgt, &vhost->targets, queue) {
> -			if (!crq->scsi_id && !crq->wwpn && !crq->node_name)
> +		list_for_each_entry_safe(tgt, next, &vhost->targets, queue) {
> +			if (!scsi_id && !wwpn && !node_name)
>  				break;
> -			if (crq->scsi_id && cpu_to_be64(tgt->scsi_id) != crq->scsi_id)
> +			if (scsi_id && cpu_to_be64(tgt->scsi_id) != scsi_id)
>  				continue;
> -			if (crq->wwpn && cpu_to_be64(tgt->ids.port_name) != crq->wwpn)
> +			if (wwpn && cpu_to_be64(tgt->ids.port_name) != wwpn)
>  				continue;
> -			if (crq->node_name && cpu_to_be64(tgt->ids.node_name) != crq->node_name)
> +			if (node_name && cpu_to_be64(tgt->ids.node_name) != node_name)
>  				continue;
> -			if (tgt->need_login && be64_to_cpu(crq->event) == IBMVFC_AE_ELS_LOGO)
> +			if (tgt->need_login && event == IBMVFC_AE_ELS_LOGO)
>  				tgt->logo_rcvd = 1;
> -			if (!tgt->need_login || be64_to_cpu(crq->event) == IBMVFC_AE_ELS_PLOGI) {
> +			if (!tgt->need_login || event == IBMVFC_AE_ELS_PLOGI) {
>  				ibmvfc_del_tgt(tgt);
>  				ibmvfc_reinit_host(vhost);
>  			}
>  		}
>  		break;
> -	case IBMVFC_AE_LINK_DOWN:
> -	case IBMVFC_AE_ADAPTER_FAILED:
> -		ibmvfc_link_down(vhost, IBMVFC_LINK_DOWN);
> -		break;
> -	case IBMVFC_AE_LINK_DEAD:
> -		ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
> -		break;
> -	case IBMVFC_AE_HALT:
> -		ibmvfc_link_down(vhost, IBMVFC_HALTED);
> -		break;
>  	case IBMVFC_AE_FPIN:
>  		aw = kzalloc(sizeof(struct ibmvfc_async_work), GFP_ATOMIC);
>  		if (aw) {
>  			clear_valid = false;
>  			INIT_WORK(&aw->async_work_s, ibmvfc_process_async_work);
>  			aw->vhost = vhost;
> -			aw->crq = crq;
> +			if (aw_crq)
> +				aw->crq = aw_crq;
> +			if (aw_subq)
> +				aw->subq = aw_subq;
>  			schedule_work(&aw->async_work_s);
>  		} else
>  			dev_err_ratelimited(vhost->dev,
>  					    "can't offload async CRQ to work queue\n");
>  		break;
>  	default:
> -		dev_err(vhost->dev, "Unknown async event received: %lld\n", crq->event);
> +		dev_err(vhost->dev, "Unknown async event received: %llu\n", event);
>  		break;
>  	}
>  
> -	if (clear_valid)
> -		crq->valid = 0;
> +	if (clear_valid) {
> +		if (aw_crq)
> +			aw_crq->valid = 0;
> +		if (aw_subq)
> +			aw_subq->valid = 0;

You are missing wmb() barriers here.

> +	}
> +}
> +
> +/**
> + * ibmvfc_handle_async - Handle an async event from the adapter
> + * @crq:	crq to process
> + * @vhost:	ibmvfc host struct
> + *
> + **/
> +VISIBLE_IF_KUNIT void ibmvfc_handle_async(struct ibmvfc_async_crq *crq,
> +					  struct ibmvfc_host *vhost)

async and asyncq as in the function name below can be hard to notice the
difference in name convention. Maybe async_subq would be a better ender, but as
it might be eaiser to just call ibmvfc_handle_async_common(crq, 0) and
ibmfvc_handle_async(sub_crq, 1), as I outlined above in each of the interrupt
handlers.

> +{
> +	const struct ibmvfc_async_desc *desc = ibmvfc_get_ae_desc(be64_to_cpu(crq->event));
> +	u64 event = be64_to_cpu(crq->event);
> +
> +	ibmvfc_log(vhost, desc->log_level,
> +		   "%s event received. scsi_id: %llx, wwpn: %llx, node_name: %llx%s\n",
> +		   desc->desc, be64_to_cpu(crq->scsi_id),
> +		   be64_to_cpu(crq->wwpn), be64_to_cpu(crq->node_name),
> +		   ibmvfc_get_link_state(crq->link_state));
> +
> +	ibmvfc_handle_async_common(event, crq->link_state, vhost,
> +				   crq->scsi_id, crq->wwpn, crq->node_name,
> +				   crq, NULL);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(ibmvfc_handle_async);
>  
> +VISIBLE_IF_KUNIT void ibmvfc_handle_asyncq(struct ibmvfc_crq *crq_instance,
> +					   struct ibmvfc_host *vhost)
> +{
> +	struct ibmvfc_async_subq *crq = (struct ibmvfc_async_subq *)crq_instance;
> +	const struct ibmvfc_async_desc *desc = ibmvfc_get_ae_desc(be16_to_cpu(crq->event));
> +	u64 event = be16_to_cpu(crq->event);
> +
> +	ibmvfc_log(vhost, desc->log_level,
> +		   "%s event received. wwpn: %llx, node_name: %llx%s event 0x%x\n",
> +		   desc->desc, be64_to_cpu(crq->wwpn), be64_to_cpu(crq->id.node_name),
> +		   ibmvfc_get_link_state(crq->link_state), be16_to_cpu(crq->event));
> +
> +	ibmvfc_handle_async_common(event, crq->link_state, vhost,
> +				   0, crq->wwpn, crq->id.node_name,
> +				   NULL, crq);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(ibmvfc_handle_asyncq);
> +
>  /**
>   * ibmvfc_handle_crq - Handles and frees received events in the CRQ
>   * @crq:	Command/Response queue
> @@ -4117,6 +4229,13 @@ static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost
>  	spin_unlock(&evt->queue->l_lock);
>  }
>  
> +/**
> + * ibmvfc_next_scrq - Returns the next entry in message subqueue
> + * @scrq:	Pointer to message subqueue
> + *
> + * Returns:
> + *	Pointer to next entry in queue / NULL if empty
> + **/
>  static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_queue *scrq)
>  {
>  	struct ibmvfc_crq *crq;
> @@ -4132,6 +4251,57 @@ static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_queue *scrq)
>  	return crq;
>  }
>  
> +static void ibmvfc_drain_async_subq(struct ibmvfc_queue *scrq)
> +{
> +	struct ibmvfc_crq *crq;
> +	unsigned long flags;
> +	int done = 0;
> +
> +	ENTER;
> +
> +	spin_lock_irqsave(scrq->q_lock, flags);
> +	while (!done) {
> +		while ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
> +			ibmvfc_handle_asyncq(crq, scrq->vhost);
> +			crq->valid = 0;

Isn't up to the handle_async_common to clear the valid crq bit depending on the
type of async action?

> +			wmb();	/* complete write */
> +		}
> +
> +		ibmvfc_toggle_scrq_irq(scrq, 1);
> +		crq = ibmvfc_next_scrq(scrq);
> +		if (crq != NULL) {
> +			ibmvfc_toggle_scrq_irq(scrq, 0);
> +			ibmvfc_handle_asyncq(crq, scrq->vhost);
> +			crq->valid = 0;

Same comment as above.

> +			wmb();	/* complete write */
> +		} else
> +			done = 1;
> +	}
> +	spin_unlock_irqrestore(scrq->q_lock, flags);
> +
> +	LEAVE;
> +}
> +
> +/**
> + * ibmvfc_interrupt_asyncq - Handle an async event from the adapter
> + * @irq:           interrupt request
> + * @scrq_instance: async subq
> + *
> + **/
> +static irqreturn_t ibmvfc_interrupt_asyncq(int irq, void *scrq_instance)
> +{
> +	struct ibmvfc_queue *scrq = (struct ibmvfc_queue *)scrq_instance;
> +
> +	ENTER;
> +
> +	ibmvfc_toggle_scrq_irq(scrq, 0);
> +	ibmvfc_drain_async_subq(scrq);
> +
> +	LEAVE;
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static void ibmvfc_drain_sub_crq(struct ibmvfc_queue *scrq)
>  {
>  	struct ibmvfc_crq *crq;
> @@ -5500,6 +5670,8 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
>  	unsigned int npiv_max_sectors;
>  	int level = IBMVFC_DEFAULT_LOG_LEVEL;
>  
> +	ENTER;
> +
>  	switch (mad_status) {
>  	case IBMVFC_MAD_SUCCESS:
>  		ibmvfc_free_event(evt);
> @@ -5578,6 +5750,8 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
>  		ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
>  		wake_up(&vhost->work_wait_q);
>  	}
> +
> +	LEAVE;

Also, please drop the ENTER/LEAVE macros as these look like debug artifacts.
Especially, in common code paths like the interrupt handlers.

-Tyrel

>  }
>  
>  /**
> @@ -6226,14 +6400,26 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
>  	return retrc;
>  }
>  
> -static int ibmvfc_register_channel(struct ibmvfc_host *vhost,
> -				   struct ibmvfc_channels *channels,
> -				   int index)
> +static inline char *ibmvfc_channel_index(struct ibmvfc_channels *channels,
> +					 struct ibmvfc_queue *scrq,
> +					 char *buf, size_t bufsize)
> +{
> +	if (scrq < channels->scrqs || scrq >= channels->scrqs + channels->active_queues)
> +		strscpy(buf, "async", 6);
> +	else
> +		snprintf(buf, bufsize, "%ld", scrq - channels->scrqs);
> +	return buf;
> +}
> +
> +static int ibmvfc_register_channel_handler(struct ibmvfc_host *vhost,
> +					   struct ibmvfc_channels *channels,
> +					   struct ibmvfc_queue *scrq,
> +					   irq_handler_t irq)
>  {
>  	struct device *dev = vhost->dev;
>  	struct vio_dev *vdev = to_vio_dev(dev);
> -	struct ibmvfc_queue *scrq = &channels->scrqs[index];
>  	int rc = -ENOMEM;
> +	char buf[16];
>  
>  	ENTER;
>  
> @@ -6252,20 +6438,23 @@ static int ibmvfc_register_channel(struct ibmvfc_host *vhost,
>  
>  	if (!scrq->irq) {
>  		rc = -EINVAL;
> -		dev_err(dev, "Error mapping sub-crq[%d] irq\n", index);
> +		dev_err(dev, "Error mapping sub-crq[%s] irq\n",
> +			ibmvfc_channel_index(channels, scrq, buf, sizeof(buf)));
>  		goto irq_failed;
>  	}
>  
>  	switch (channels->protocol) {
>  	case IBMVFC_PROTO_SCSI:
> -		snprintf(scrq->name, sizeof(scrq->name), "ibmvfc-%x-scsi%d",
> -			 vdev->unit_address, index);
> -		scrq->handler = ibmvfc_interrupt_mq;
> +		snprintf(scrq->name, sizeof(scrq->name), "ibmvfc-%x-scsi%s",
> +			 vdev->unit_address,
> +			 ibmvfc_channel_index(channels, scrq, buf, sizeof(buf)));
> +		scrq->handler = irq;
>  		break;
>  	case IBMVFC_PROTO_NVME:
> -		snprintf(scrq->name, sizeof(scrq->name), "ibmvfc-%x-nvmf%d",
> -			 vdev->unit_address, index);
> -		scrq->handler = ibmvfc_interrupt_mq;
> +		snprintf(scrq->name, sizeof(scrq->name), "ibmvfc-%x-nvmf%s",
> +			 vdev->unit_address,
> +			 ibmvfc_channel_index(channels, scrq, buf, sizeof(buf)));
> +		scrq->handler = irq;
>  		break;
>  	default:
>  		dev_err(dev, "Unknown channel protocol (%d)\n",
> @@ -6276,12 +6465,14 @@ static int ibmvfc_register_channel(struct ibmvfc_host *vhost,
>  	rc = request_irq(scrq->irq, scrq->handler, 0, scrq->name, scrq);
>  
>  	if (rc) {
> -		dev_err(dev, "Couldn't register sub-crq[%d] irq\n", index);
> +		dev_err(dev, "Couldn't register sub-crq[%s] irq\n",
> +			ibmvfc_channel_index(channels, scrq, buf, sizeof(buf)));
>  		irq_dispose_mapping(scrq->irq);
>  		goto irq_failed;
>  	}
>  
> -	scrq->hwq_id = index;
> +	if (scrq >= channels->scrqs && scrq < channels->scrqs + channels->max_queues)
> +		scrq->hwq_id = scrq - channels->scrqs;
>  
>  	LEAVE;
>  	return 0;
> @@ -6295,13 +6486,21 @@ static int ibmvfc_register_channel(struct ibmvfc_host *vhost,
>  	return rc;
>  }
>  
> +static inline int
> +ibmvfc_register_channel(struct ibmvfc_host *vhost,
> +			struct ibmvfc_channels *channels,
> +			struct ibmvfc_queue *scrq)
> +{
> +	return ibmvfc_register_channel_handler(vhost, channels, scrq, ibmvfc_interrupt_mq);
> +}
> +
>  static void ibmvfc_deregister_channel(struct ibmvfc_host *vhost,
>  				      struct ibmvfc_channels *channels,
> -				      int index)
> +				      struct ibmvfc_queue *scrq)
>  {
>  	struct device *dev = vhost->dev;
>  	struct vio_dev *vdev = to_vio_dev(dev);
> -	struct ibmvfc_queue *scrq = &channels->scrqs[index];
> +	char buf[16];
>  	long rc;
>  
>  	ENTER;
> @@ -6316,7 +6515,8 @@ static void ibmvfc_deregister_channel(struct ibmvfc_host *vhost,
>  	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
>  
>  	if (rc)
> -		dev_err(dev, "Failed to free sub-crq[%d]: rc=%ld\n", index, rc);
> +		dev_err(dev, "Failed to free sub-crq[%s]: rc=%ld\n",
> +			ibmvfc_channel_index(channels, scrq, buf, sizeof(buf)), rc);
>  
>  	/* Clean out the queue */
>  	memset(scrq->msgs.crq, 0, PAGE_SIZE);
> @@ -6334,10 +6534,21 @@ static void ibmvfc_reg_sub_crqs(struct ibmvfc_host *vhost,
>  	if (!vhost->mq_enabled || !channels->scrqs)
>  		return;
>  
> +	if (ibmvfc_register_channel_handler(vhost, channels,
> +					    channels->async_scrq,
> +					    ibmvfc_interrupt_asyncq)) {
> +		vhost->do_enquiry = 0;
> +		return;
> +	}
> +
>  	for (i = 0; i < channels->max_queues; i++) {
> -		if (ibmvfc_register_channel(vhost, channels, i)) {
> +		if (ibmvfc_register_channel(vhost, channels, &channels->scrqs[i])) {
>  			for (j = i; j > 0; j--)
> -				ibmvfc_deregister_channel(vhost, channels, j - 1);
> +				ibmvfc_deregister_channel(
> +					vhost, channels, &channels->scrqs[j - 1]);
> +			ibmvfc_deregister_channel(vhost, channels,
> +							channels->async_scrq);
> +
>  			vhost->do_enquiry = 0;
>  			return;
>  		}
> @@ -6356,7 +6567,8 @@ static void ibmvfc_dereg_sub_crqs(struct ibmvfc_host *vhost,
>  		return;
>  
>  	for (i = 0; i < channels->max_queues; i++)
> -		ibmvfc_deregister_channel(vhost, channels, i);
> +		ibmvfc_deregister_channel(vhost, channels, &channels->scrqs[i]);
> +	ibmvfc_deregister_channel(vhost, channels, channels->async_scrq);
>  
>  	LEAVE;
>  }
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
> index f026f30f98d3..2e02acde0178 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.h
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.h
> @@ -715,6 +715,7 @@ struct ibmvfc_async_crq {
>  struct ibmvfc_async_work {
>  	struct ibmvfc_host *vhost;
>  	struct ibmvfc_async_crq *crq;
> +	struct ibmvfc_async_subq *subq;
>  	struct work_struct async_work_s;
>  };
>  
> @@ -1008,6 +1009,8 @@ struct ibmvfc_host {
>  
>  #ifdef VISIBLE_IF_KUNIT
>  VISIBLE_IF_KUNIT void ibmvfc_handle_async(struct ibmvfc_async_crq *crq, struct ibmvfc_host *vhost);
> +VISIBLE_IF_KUNIT void ibmvfc_handle_asyncq(struct ibmvfc_crq *crq_instance,
> +					   struct ibmvfc_host *vhost);
>  VISIBLE_IF_KUNIT struct list_head *ibmvfc_get_headp(void);
>  #endif
>  
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc_kunit.c b/drivers/scsi/ibmvscsi/ibmvfc_kunit.c
> index e41e2a49e549..c8799eaf4927 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc_kunit.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc_kunit.c
> @@ -44,7 +44,7 @@ static void ibmvfc_async_fpin_test(struct kunit *test)
>  	fc_host = shost_to_fc_host(vhost->host);
>  
>  	pre[IBMVFC_AE_FPIN_LINK_CONGESTED] = READ_ONCE(fc_host->fpin_stats.cn_device_specific);
> -	pre[IBMVFC_AE_FPIN_PORT_CONGESTED] = READ_ONCE(tgt->rport->fpin_stats.cn);
> +	pre[IBMVFC_AE_FPIN_PORT_CONGESTED] = READ_ONCE(tgt->rport->fpin_stats.cn_device_specific);
>  	pre[IBMVFC_AE_FPIN_PORT_CLEARED] = READ_ONCE(tgt->rport->fpin_stats.cn_clear);
>  	pre[IBMVFC_AE_FPIN_PORT_DEGRADED] = READ_ONCE(tgt->rport->fpin_stats.li_failure_unknown);
>  	pre[IBMVFC_AE_FPIN_CONGESTION_CLEARED] = READ_ONCE(fc_host->fpin_stats.cn_clear);
> 

-------------------- End of forwarded message --------------------
